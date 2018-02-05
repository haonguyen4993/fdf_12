# encoding: utf-8

class UserAvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process :crop_image
  # if Rails.env.production?
  #   include Cloudinary::CarrierWave
  #   process tags: ["post_picture"]
  # end

  process resize_to_limit: [300, 300]

  process convert: "png"

  version :standard do
    process resize_to_fill: [100, 100, :north]
  end

  version :thumbnail do
    resize_to_fit 50, 50
  end

  version :medium do
    resize_to_fit 300, 300
  end

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Settings.pictures.upload_dir}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url *args
    ActionController::Base
      .helpers
      .asset_path([version_name, "default_user_avatar.png"].compact.join("_"))
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def crop_image
    if model.avatar_crop_x.present?
      manipulate! do |image|
        x = model.avatar_crop_x.to_i
        y = model.avatar_crop_y.to_i
        w = model.avatar_crop_w.to_i
        h = model.avatar_crop_h.to_i
        image.crop "#{w}x#{h}+#{x}+#{y}"
        image
      end
    end
  end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
