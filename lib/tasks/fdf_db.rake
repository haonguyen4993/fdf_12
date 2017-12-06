namespace :fdf_db do
  task create_all: [:create_domain, :create_user, :create_admin, :create_shop, :create_category,
    :create_coupon, :create_product, :create_user_domain] do
  end
  task create_user: :environment do
    User.create!(
      name: "Tran Duc Quoc",
      email: "tran.duc.quoc@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )
    User.create!(
      name: "Nguyen Phan Hoang Linh",
      email: "nguyen.phan.hoang.linh@framgia.com",
      password: "123123",
      password_confirmation: "123123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Nguyen Thi A",
      email: "nguyen.thi.a@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Pham Thi b",
      email: "pham.thi.b@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Pham Van c",
      email: "pham.van.c@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Le Van d",
      email: "le.van.d@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Hoang Nhac Trung",
      email: "hoang.nhac.trung@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Join",
      email: "join@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Taylor",
      email: "taylor@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Nguyen Van S",
      email: "nguyen.van.s@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

     User.create!(
      name: "Nguyen Van V",
      email: "nguyen.van.v@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Nguyen Thi F",
      email: "nguyen.thi.f@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Tran Van Q",
      email: "tran.van.q@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Dao Tam T",
      email: "dao.tam.t@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Ta Thi Lang",
      email: "ta.thi.lang@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Ha Van H",
      email: "ha.van.h@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Nguyen Huu N",
      email: "nguyen.huu.n@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Hiroaki",
      email: "hiroaki.@framgia.com",
      password: "Aa@123",
      password_confirmation: "Aa@123",
      status: 1,
      authentication_token: Devise.friendly_token
    )

    User.create!(
      name: "Tran Thi M",
      email: "tran.thi.m@framgia.com",
      password: "123456",
      password_confirmation: "123456",
      status: 1,
      authentication_token: Devise.friendly_token
    )

  end

  task create_admin: :environment do
    Admin.create!(
      email: "forder.info@gmail.com",
      password: "Aa@123",
      password_confirmation: "Aa@123"
    )
  end

  task create_domain: :environment do
    Domain.create!(
      name: "FramgiaDN",
      status: 2,
      owner: 6
    )

    Domain.create!(
      name: "FramgiaHN",
      status: 2,
      owner: 15
    )

    Domain.create!(
      name: "FramgiaHCM",
      status: 2,
      owner: 15
    )
  end

  task create_user_domain: :environment do
    UserDomain.create!(
      user_id: 6,
      domain_id: 1,
      role: 0
    )

    UserDomain.create!(
      user_id: 7,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 8,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 9,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 10,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 11,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 12,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 13,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 14,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 15,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 16,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 17,
      domain_id: 1,
      role: 1
    )

    UserDomain.create!(
      user_id: 15,
      domain_id: 2,
      role: 0
    )

    UserDomain.create!(
      user_id: 6,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 7,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 8,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 9,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 10,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 11,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 12,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 13,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 14,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 16,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 17,
      domain_id: 2,
      role: 1
    )

    UserDomain.create!(
      user_id: 15,
      domain_id: 3,
      role: 0
    )

    UserDomain.create!(
      user_id: 6,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 7,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 8,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 9,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 10,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 11,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 12,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 13,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 14,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 16,
      domain_id: 3,
      role: 1
    )

    UserDomain.create!(
      user_id: 17,
      domain_id: 3,
      role: 1
    )
  end

  task create_shop: :environment do
    Shop.create!(
      name: "Cơm Tấm",
      description: "Cơm Tấm",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quancomtam.jpg"),
      averate_rating: 5.0,
      owner_id: 1
    )

    Shop.create!(
      name: "Sinh Tố",
      description: "Sinh Tố",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quansinhto.jpg"),
      owner_id: 4
    )

    Shop.create!(
      name: "Chè Thái",
      description: "Chè Thái",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quanchethai.jpg"),
      owner_id: 3
    )

    Shop.create!(
      name: "Dừa Bến Tre",
      description: "Dừa Bến Tre",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quandua.jpg"),
      owner_id: 3
    )

    Shop.create!(
      name: "Mì Quảng",
      description: "Mì Quảng",
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quanmiquang.jpg"),
      owner_id: 1,
      status: 1
    )

    Shop.create!(
      name: "Nếp Cẩm",
      description: "Nếp Cẩm",
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quansinhto.jpg"),
      owner_id: 1,
      status: 1
    )

    Shop.create!(
      name: "Highland",
      description: "Highland",
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/quansinhto.jpg"),
      owner_id: 5,
      status: 1
    )

    Shop.create!(
      name: "Mì Que",
      description: "Mì Que",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/cuahangmyque.jpg"),
      owner_id: 2
    )

    Shop.create!(
      name: "Tàu hủ",
      description: "Tàu hủ",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/cuahangtauhu.jpg"),
      owner_id: 2
    )

    Shop.create!(
      name: "Bún thịt nướng",
      description: "Bún thịt nướng",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/cuahangbunthitnuong.jpg"),
      owner_id: 1
    )

    Shop.create!(
      name: "TOCOTOCO",
      description: "Trà sữa, Macchiato, ...",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/tocotoco_shop.jpg"),
      owner_id: 18
    )

    Shop.create!(
      name: "Coco",
      description: "Nước giải khát trái cây",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/coco_shop.jpg"),
      owner_id: 18
    )

    Shop.create!( #13
      name: "Trà sữa Gong Cha",
      description: "Trà sữa, nước giải khát",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/cuahangtrasuagongcha.jpg"),
      owner_id: 1
    )
    Shop.create!( #14
      name: "Trà sữa BoBaPop",
      description: "Trà sữa, nước giải khát",
      status: 1,
      cover_image: "image",
      avatar: File.open(Rails.root + "public/images/cuahangtrasuabobapop.jpg"),
      owner_id: 1
    )
  end

  task create_category: :environment do
    Category.create!(
      name: "Cơm"
    )

    Category.create!(
      name: "Chè"
    )

    Category.create!(
      name: "Sinh Tố"
    )

    Category.create!(
      name: "Mì Quảng"
    )

    Category.create!(
      name: "Dừa"
    )

    Category.create!(
      name: "Nếp Cẩm"
    )

    Category.create!(
      name: "Highland"
    )

    Category.create!(
      name: "Mì que"
    )

    Category.create!(
      name: "Tàu hủ"
    )

    Category.create!(
      name: "Bún thịt nướng"
    )

    Category.create!( #11
      name: "Trà sữa"
    )

    Category.create!(
      name: "Nước trái cây"
    )
  end

  task create_coupon: :environment do
    Coupon.create!(
      name: "Sale 99%",
      description: "Lucky Day",
      coupon_type: 0,
      discount_type: 0,
      value: 99,
      code: "XCODE1",
      start_at: "2016-09-12 08:00:00",
      end_at: "2016-09-14 08:00:00",
      shop_id: 1,
      user_id: 1
    )
  end

  task create_product: :environment do
    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Sườn",
      price: 22000,
      description: "Cơm Sườn",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comsuon.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Xíu Mại",
      price: 22000,
      description: "Cơm Xíu Mại",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comxiumai.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Gà Kho",
      price: 22000,
      description: "Cơm Gà Kho",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comgakho.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Thịt Kho Trứng",
      price: 22000,
      description: "Cơm Thịt Kho Trứng",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comthitkhotrung.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Thịt Kho Tôm",
      price: 22000,
      description: "Cơm Thịt Kho Tôm",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comthitkhotom.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Cá Sốt Cà",
      price: 22000,
      description: "Cơm Cá Sốt Cà",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comcasotca.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Sườn Non",
      price: 24000,
      description: "Cơm Sườn Non",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comsuonnon.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Gà Đùi",
      price: 24000,
      description: "Cơm Gà Đùi",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comgadui.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Đậu Nhồi Thịt",
      price: 20000,
      description: "Cơm Đậu Nhồi Thịt",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comdaunhoithit.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Mực Nhồi Thịt",
      price: 24000,
      description: "Cơm Mực Nhồi Thịt",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/commucnhoithit.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Chim Cút Roty",
      price: 24000,
      description: "Cơm Chim Cút Roty",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comchimcutroty.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Cơm Thịt Heo Chiên",
      price: 22000,
      description: "Cơm Thịt Heo Chiên",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/comthitheochien.jpg")
    )

    Product.create!(
      category_id: 1,
      status: 0,
      shop_id: 1,
      user_id: 1,
      name: "Canh Khổ Qua",
      price: 5000,
      description: "Canh Khổ Qua",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/canhkhoqua.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Chè Thái Có Sầu Riêng",
      price: 20000,
      description: "Chè Thái Có Sầu Riêng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chethaicosaurieng.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Chè Thái Không Sầu Riêng",
      price: 16000,
      description: "Chè Thái Không Sầu Riêng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chethaikhongsaurieng.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Đậu Hũ Sầu Riêng",
      price: 18000,
      description: "Đậu Hũ Sầu Riêng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dauhusaurieng.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Đậu Hũ Sữa Dừa",
      price: 14000,
      description: "Đậu Hũ Sữa Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dauhusuadua.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Đậu Hũ Socola",
      price: 14000,
      description: "Đậu Hũ Socola",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dauhusocola.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Đậu Hũ Dâu",
      price: 14000,
      description: "Đậu Hũ Dâu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dauhudau.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Đậu Hũ Đậu Nành",
      price: 14000,
      description: "Đậu Hũ Đậu Nành",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dauhudaunanh.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Flan",
      price: 10000,
      description: "Flan",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/flan.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Flan Sầu Riêng",
      price: 14000,
      description: "Flan Sầu Riêng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/flansaurieng.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Flan Kem Tươi",
      price: 12000,
      description: "Flan Kem Tươi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/flankemtuoi.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Flan Dâu",
      price: 10000,
      description: "Flan Dâu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/flandau.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Flan Dừa",
      price: 10000,
      description: "Flan Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/flandua.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Yaourt Nếp Cẩm",
      price: 18000,
      description: "Yaourt Nếp Cẩm",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yaourtnepcam.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Chè Đậu Xanh Đánh",
      price: 16000,
      description: "Chè Đậu Xanh Đánh",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chedauxanhdanh.jpg")
    )

    Product.create!(
      category_id: 2,
      status: 0,
      shop_id: 3,
      user_id: 3,
      name: "Chè Khúc Bạch",
      price: 16000,
      description: "Chè Khúc Bạch",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chekhucbach.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Sinh Tố",
      price: 15000,
      description: "Sinh Tố",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/sinhto.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Chè Xoa Xoa",
      price: 12000,
      description: "Chè Xoa Xoa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chexoaxoa.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Chè Đậu Xanh",
      price: 10000,
      description: "Chè Đậu Xanh",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chedauxanh.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Sâm Bổ Lượng",
      price: 15000,
      description: "Sâm Bổ Lượng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/samboluong.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Chè Mít",
      price: 15000,
      description: "Chè Mít",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chemit.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Dâu Xay Sữa Chua",
      price: 20000,
      description: "Dâu Xay Sữa Chua",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dauxaysuachua.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Nước Chanh",
      price: 10000,
      description: "Nước Chanh",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuocchanh.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Cóc Ép",
      price: 12000,
      description: "Cóc Ép",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/cocep.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Cà Rốt Ép",
      price: 12000,
      description: "Cà Rốt Ép",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/carotep.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Thơm Ép",
      price: 12000,
      description: "Thơm Ép",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/thomep.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Chè Đậu Thập Cẩm",
      price: 12000,
      description: "Chè Đậu Thập Cẩm",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chedauthapcam.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Chè Đậu Đỏ",
      price: 12000,
      description: "Chè Đậu Đỏ",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chedaudo.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Chanh Dây",
      price: 10000,
      description: "Chanh Dây",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chanhday.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Sinh Tố Bơ",
      price: 30000,
      description: "Sinh Tố Bơ",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/sinhtobo.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Nước Cam",
      price: 20000,
      description: "Nước Cam",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoccam.jpg")
    )

    Product.create!(
      category_id: 3,
      status: 0,
      shop_id: 2,
      user_id: 2,
      name: "Sinh Tố Mãng Cầu",
      price: 20000,
      description: "Sinh Tố Mãng Cầu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/sinhtomangcau.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Dừa Bến Tre",
      price: 22000,
      description: "Dừa Bến Tre",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/dua.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Rau Câu Trái Dừa",
      price: 30000,
      description: "Rau Câu Trái Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/raucautraidua.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Rau Câu Flan Trái Dừa",
      price: 33000,
      description: "Rau Câu Flan Trái Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/raucauflandua.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Yaourt Dừa",
      price: 15000,
      description: "Yaourt Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yaourtdua.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Yaourt Trái Dừa",
      price: 45000,
      description: "Yaourt Trái Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yaourttraidua.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Yaourt Dừa Trái Cây",
      price: 20000,
      description: "Yaourt Dừa Trái Cây",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yaourtduatraicay.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Yaourt Bơ Sầu Riêng",
      price: 25000,
      description: "Yaourt Bơ + Sầu Riêng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yaourtbosaurieng.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Mít Sữa Dừa",
      price: 20000,
      description: "Mít Sữa Dừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/mitsuadua.jpg")
    )

    Product.create!(
      category_id: 5,
      status: 0,
      shop_id: 4,
      user_id: 4,
      name: "Mít Sữa Dừa Sầu Riêng",
      price: 25000,
      description: "Mít Sữa Dừa Sầu Riêng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/mitsuaduasaurieng.jpg")
    )

    Product.create!(
      category_id: 4,
      status: 0,
      shop_id: 5,
      user_id: 4,
      name: "Mì Quảng Ếch",
      price: 30000,
      description: "Mì Quảng Ếch",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/miquangech.jpg")
    )

    Product.create!(
      category_id: 4,
      status: 0,
      shop_id: 5,
      user_id: 4,
      name: "Mì Quảng Lươn",
      price: 30000,
      description: "Mì Quảng Lươn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/miquangluon.jpg")
    )

    Product.create!(
      category_id: 4,
      status: 0,
      shop_id: 5,
      user_id: 4,
      name: "Mì Quảng Sườn",
      price: 25000,
      description: "Mì Quảng Sườn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/miquangsuon.jpg")
    )

    Product.create!(
      category_id: 4,
      status: 0,
      shop_id: 5,
      user_id: 4,
      name: "Mì Quảng Bò",
      price: 20000,
      description: "Mì Quảng Bò",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/miquangbo.jpg")
    )

    Product.create!(
      category_id: 4,
      status: 0,
      shop_id: 5,
      user_id: 4,
      name: "Mì Quảng Gà",
      price: 20000,
      description: "Mì Quảng Gà",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/miquangga.jpg")
    )

    Product.create!(
      category_id: 4,
      status: 0,
      shop_id: 5,
      user_id: 4,
      name: "Mì Quảng Cá Lóc",
      price: 20000,
      description: "Mì Quảng Cá Lóc",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/miquangcaloc.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Sữa chua-15",
      price: 15000,
      description: "Sữa chua-15",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/suachua.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Sữa chua-20",
      price: 20000,
      description: "Sữa chua-20",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/suachua.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Nước sấu-15",
      price: 15000,
      description: "Nước sấu-15",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuocsau.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Nếp cẩm-20",
      price: 20000,
      description: "Nếp cẩm-20",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nepcam.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Nếp cẩm-15",
      price: 15000,
      description: "Nếp cẩm-15",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nepcam.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Khoai lang tẩm mật ong chiên",
      price: 30000,
      description: "Khoai lang tẩm mật ong chiên",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/khoailang.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Nem chua rán nhỏ",
      price: 30000,
      description: "Nem chua rán nhỏ",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nemchua.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Nem chua rán lớn",
      price: 50000,
      description: "Nem chua rán lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nemchua.jpg")
    )

    Product.create!(
      category_id: 6,
      status: 0,
      shop_id: 6,
      user_id: 1,
      name: "Nước mơ",
      price: 15000,
      description: "Nước mơ",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuocmo.jpg")
    )


    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Phin Sữa Đá",
      price: 29000,
      description: "Phin Sữa Đá",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/phinsuada.jpg")
    )

    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Cacao Nóng",
      price: 54000,
      description: "Cacao Nóng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/cacaonong.jpg")
    )

    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Trà Sen Vàng",
      price: 49000,
      description: "Trà Sen Vàng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasenvang.jpg")
    )

    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Trà Thanh Đào",
      price: 49000,
      description: "Trà Thanh Đào",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trathanhdao.jpg")
    )

    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Nâu nóng",
      price: 29000,
      description: "Nâu nóng",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/naunong.jpg")
    )

    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Freeze Matcha",
      price: 59000,
      description: "Freeze Matcha",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/freeze.jpg")
    )

    Product.create!(
      category_id: 7,
      status: 0,
      shop_id: 7,
      user_id: 5,
      name: "Trà Thạch Đào",
      price: 49000,
      description: "Trà Thạch Đào",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trathachdao.jpg")
    )

    Product.create!(
      category_id: 8,
      status: 0,
      shop_id: 8,
      user_id: 1,
      name: "Mì que",
      price: 7000,
      description: "Mì que",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/banhmyque.jpg")
    )

    Product.create!(
      category_id: 9,
      status: 0,
      shop_id: 9,
      user_id: 1,
      name: "Tàu hủ rau câu",
      price: 12000,
      description: "Tàu hủ rau câu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tauhu.jpg")
    )

    Product.create!(
      category_id: 10,
      status: 0,
      shop_id: 10,
      user_id: 1,
      name: "Bún thịt nướng",
      price: 25000,
      description: "Bún thịt nướng",
      start_hour: "10:00:00",
      end_hour: "11:00:00",
      image: File.open(Rails.root + "public/images/bunthitnuong.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Hồng Trà Lớn",
      price: 30000,
      description: "Hồng Trà Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/hongtra.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Hồng Trà Vừa",
      price: 25000,
      description: "Hồng Trà Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/hongtra.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Sữa Lớn",
      price: 36000,
      description: "Trà Sữa Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tocotoco.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Sữa Vừa",
      price: 30000,
      description: "Trà Sữa Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tocotoco.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Sữa Panda Lớn",
      price: 44000,
      description: "Trà Sữa Panda Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_panda.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Sữa Panda Vừa",
      price: 38000,
      description: "Trà Sữa Panda Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_panda.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Sữa Nhật Đậu Đỏ Lớn",
      price: 46000,
      description: "Trà Sữa Nhật Đậu Đỏ Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_nhatdaudo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Sữa Nhật Đậu Đỏ Vừa",
      price: 42000,
      description: "Trà Sữa Nhật Đậu Đỏ Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_nhatdaudo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Hồng Trà Kem Dừa Vừa",
      price: 38000,
      description: "Hồng Trà Kem Dừa Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/hongtra_kemdua.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa cafe Lớn",
      price: 44000,
      description: "Trà sữa cafe Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_cafe.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa cafe Vừa",
      price: 38000,
      description: "Trà sữa cafe Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_cafe.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Trân châu sợi Lớn",
      price: 42000,
      description: "Trà sữa Trân châu sợi Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tranchausoi.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Trân châu sợi Vừa",
      price: 37000,
      description: "Trà sữa Trân châu sợi Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tranchausoi.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Kim Cương Đen Okinawa Lớn",
      price: 44000,
      description: "Trà sữa Kim Cương Đen Okinawa Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tranchauokinawa.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Kim Cương Đen Okinawa Vừa",
      price: 38000,
      description: "Trà sữa Kim Cương Đen Okinawa Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tranchauokinawa.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Hokkaidou Lớn",
      price: 44000,
      description: "Trà sữa Hokkaidou Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_hokkaidou.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Hokkaidou Vừa",
      price: 38000,
      description: "Trà sữa Hokkaidou Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_hokkaidou.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Toco Socola Lớn",
      price: 42000,
      description: "Toco Socola Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/toco_socola.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Toco Socola Vừa",
      price: 37000,
      description: "Toco Socola Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/toco_socola.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa bạc hà Lớn",
      price: 42000,
      description: "Trà sữa bạc hà Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_bacha.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa bạc hà Vừa",
      price: 37000,
      description: "Trà sữa bạc hà Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_bacha.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa dâu tây Lớn",
      price: 42000,
      description: "Trà sữa dâu tây Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_dautay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa dâu tây Vừa",
      price: 37000,
      description: "Trà sữa dâu tây Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_dautay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa trân châu Boba Lớn",
      price: 42000,
      description: "Trà sữa trân châu Boba Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tranchauboba.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa trân châu Boba Vừa",
      price: 37000,
      description: "Trà sữa trân châu Boba Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_tranchauboba.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa ba anh em Lớn",
      price: 44000,
      description: "Trà sữa ba anh em Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_baanhem.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa ba anh em Vừa",
      price: 38000,
      description: "Trà sữa ba anh em Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_baanhem.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa xanh sữa vị nhài Lớn",
      price: 40000,
      description: "Trà sữa xanh sữa vị nhài Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_vinhai.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa xanh sữa vị nhài Vừa",
      price: 35000,
      description: "Trà sữa xanh sữa vị nhài Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_vinhai.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa dưa gang Lớn",
      price: 42000,
      description: "Trà sữa dưa gang Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_duagang.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa dưa gang Vừa",
      price: 37000,
      description: "Trà sữa dưa gang Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_duagang.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Toco Lớn",
      price: 44000,
      description: "Trà sữa Toco Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_toco.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa Toco Vừa",
      price: 38000,
      description: "Trà sữa Toco Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_toco.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa rau cau Lớn",
      price: 42000,
      description: "Trà sữa rau cau Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_raucau.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa rau cau Vừa",
      price: 37000,
      description: "Trà sữa rau cau Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_raucau.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa bánh Pudding Lớn",
      price: 42000,
      description: "Trà sữa bánh Pudding Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_pudding.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà sữa bánh Pudding Vừa",
      price: 37000,
      description: "Trà sữa bánh Pudding Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasua_pudding.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh Lớn",
      price: 30000,
      description: "Trà xanh Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tra_xanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh Vừa",
      price: 25000,
      description: "Trà xanh Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tra_xanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Hồng trà việt quất Lớn",
      price: 38000,
      description: "Hồng trà việt quất Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/hong_tra_viet_quoc.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Hồng trà việt quất Vừa",
      price: 33000,
      description: "Hồng trà việt quất Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/hong_tra_viet_quoc.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Chanh hoàng gia Lớn",
      price: 48000,
      description: "Trà Chanh hoàng gia Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trachanh_hoanggia.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh collagen VitaminC Lớn",
      price: 44000,
      description: "Trà xanh kết hợp kiwi chanh leo",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_collagen.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh collagen VitaminC Vừa",
      price: 39000,
      description: "Trà xanh kết hợp kiwi chanh leo",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_collagen.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh Đào Dâu tây Lớn",
      price: 40000,
      description: "Trà xanh Đào & Dâu tây Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_dao_dautay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh Đào Dâu tây Vừa",
      price: 35000,
      description: "Trà xanh Đào & Dâu tây Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_dao_dautay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh chanh quốc mật ong Lớn",
      price: 40000,
      description: "Trà xanh chanh quốc mật ong Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_chanhquoc_matong.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh chanh quốc mật ong Vừa",
      price: 35000,
      description: "Trà xanh chanh quốc mật ong Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_chanhquoc_matong.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh chanh leo Lớn",
      price: 38000,
      description: "Trà xanh chanh leo Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_chanhleo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh chanh leo Vừa",
      price: 33000,
      description: "Trà xanh chanh leo Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_chanhleo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh chanh xoài Lớn",
      price: 38000,
      description: "Trà xanh chanh xoài Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_xoai.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh chanh xoài Vừa",
      price: 33000,
      description: "Trà xanh chanh xoài Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_xoai.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh đào chanh leo Lớn",
      price: 40000,
      description: "Trà xanh đào & chanh leo Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_dao_chanhleo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh đào chanh leo Vừa",
      price: 33000,
      description: "Trà xanh đào & chanh leo Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_dao_chanhleo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh mật ong sợi Lớn",
      price: 44000,
      description: "Trà xanh mật ong sợi Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_matongsoi.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà xanh mật ong sợi Vừa",
      price: 37000,
      description: "Trà xanh mật ong sợi Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanh_matongsoi.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Matcha Lớn",
      price: 44000,
      description: "Macchiato Matcha Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato_matcha.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Matcha Vừa",
      price: 38000,
      description: "Macchiato Matcha Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato_matcha.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Hồng trà Lớn",
      price: 40000,
      description: "Macchiato Hồng trà Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato_hongtra.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Hồng trà Vừa",
      price: 35000,
      description: "Macchiato Hồng trà Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato_hongtra.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Socola Lớn",
      price: 44000,
      description: "Macchiato Socola Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato_socola.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Socola Vừa",
      price: 38000,
      description: "Macchiato Socola Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato_socola.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Trà xanh Lớn",
      price: 40000,
      description: "Macchiato Trà xanh Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato-tra-xanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato Trà xanh Vừa",
      price: 35000,
      description: "Macchiato Trà xanh Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato-tra-xanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Yakult Trà xanh Lớn",
      price: 42000,
      description: "Macchiato Trà xanh Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yakult_traxanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Yakult Trà xanh Vừa",
      price: 37000,
      description: "Macchiato Trà xanh Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yakult_traxanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Yakult Chanh leo Lớn",
      price: 42000,
      description: "Yakult Chanh leo Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yakult_chanhleo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Yakult Chanh leo Vừa",
      price: 37000,
      description: "Yakult Chanh leo Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yakult_chanhleo.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Yakult Xoài Lớn",
      price: 42000,
      description: "Yakult Xoài Lớn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yakult_xoai.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Yakult Xoài Vừa",
      price: 37000,
      description: "Yakult Xoài Vừa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/yakult_xoai.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trân châu sợi",
      price: 6000,
      description: "Trân châu sợi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tran_chau_soi.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Thạch cà phê",
      price: 8000,
      description: "Thạch cà phê",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/thach_cafe.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Rau câu",
      price: 6000,
      description: "Rau câu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/raucau.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Pudding",
      price: 6000,
      description: "Pudding",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/pudding.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trân châu",
      price: 6000,
      description: "Trân châu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tranchau.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Thạch matcha",
      price: 8000,
      description: "Thạch matcha",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/thach_matcha.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Lô hội",
      price: 6000,
      description: "Lô hội",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/lo_hoi.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Macchiato",
      price: 8000,
      description: "Macchiato",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/macchiato.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Hướng dương",
      price: 15000,
      description: "Hướng dương",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/hat-huong-duong.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Xúc xích",
      price: 15000,
      description: "Xúc xích",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/xuc_xich.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Bò khô",
      price: 28000,
      description: "Bò khô",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/bo_kho.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Mức việt quốc sữa chua đá xay",
      price: 42000,
      description: "Mức việt quốc sữa chua đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/muc_viet_quoc.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Trà Nhật đá xay",
      price: 42000,
      description: "Trà Nhật đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tranhat_daxay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Cafe caramel đá xay",
      price: 42000,
      description: "Cafe caramel đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/cafe_caramel.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Mứt dâu tây đá xay",
      price: 42000,
      description: "Mứt dâu tây đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/mutdautay_daxay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Xoài sữa chua đá xay",
      price: 42000,
      description: "Xoài sữa chua đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/xoai_suachua_daxay.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 11,
      user_id: 18,
      name: "Chanh leo sữa chua đá xay",
      price: 42000,
      description: "Chanh leo sữa chua đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chanhleo_suachua_daxay.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Chanh leo",
      price: 25000,
      description: "Chanh leo",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/chanh_leo_coco.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Dứa",
      price: 25000,
      description: "Nước Dứa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_dua_ep.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Cà Rốt",
      price: 25000,
      description: "Nước Cà Rốt",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_ca_rot.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Cam Cà Rốt",
      price: 30000,
      description: "Nước Cam Cà Rốt",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_cam_carot.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Cam",
      price: 30000,
      description: "Nước Cam",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_cam.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Thanh Long",
      price: 30000,
      description: "Nước Thanh Long",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_thanh_long.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Ổi",
      price: 25000,
      description: "Nước Ổi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_oi.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước khế",
      price: 25000,
      description: "Nước khế",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_khe.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Táo",
      price: 30000,
      description: "Nước Táo",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_tao.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Lê",
      price: 30000,
      description: "Nước Lê",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_le.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Bưởi",
      price: 30000,
      description: "Nước Bưởi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_buoi.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Dưa Hấu",
      price: 25000,
      description: "Nước Dưa Hấu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_duahau.jpg")
    )

    Product.create!(
      category_id: 12,
      status: 0,
      shop_id: 12,
      user_id: 18,
      name: "Nước Trà Xanh",
      price: 20000,
      description: "Nước Trà Xanh",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/nuoc_traxanh.jpg")
    )

    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà xanh kem sữa",
      price: 43000,
      description: "Trà xanh kem sữa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanhkemsua.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà sữa trà xanh",
      price: 40000,
      description: "Trà sữa trà xanh",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuatraxanh.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà Oolong kem sữa",
      price: 47000,
      description: "Trà Oolong kem sữa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traoolongkemsua.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà sữa khoai môn",
      price: 47000,
      description: "Trà sữa khoai môn",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuakhoaimon.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà Alisan kem sữa",
      price: 47000,
      description: "Trà Alisan kem sữa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traalisankemsua.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà sữa trân châu đen",
      price: 43000,
      description: "Trà sữa trân châu đen",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuatranchauden.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà sữa Hokkaido",
      price: 43000,
      description: "Trà sữa Hokkaido",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuahokkaido.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà early grey kem sữa",
      price: 47000,
      description: "Trà early grey kem sữa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traearlygreykemsua.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà sữa pudding Trứng đậu đỏ",
      price: 47000,
      description: "Trà sữa pudding Trứng đậu đỏ",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuapuddingtrungdaudo.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà xanh đào",
      price: 40000,
      description: "Trà xanh đào",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanhdao.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà xanh chanh dây",
      price: 40000,
      description: "Trà xanh chanh dây",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanhchanhday.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà Alisan xoài",
      price: 43000,
      description: "Trà Alisan xoài",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traalisanxoai.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Đào hồng mận và hột é",
      price: 43000,
      description: "Đào hồng mận và hột é",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/daohongmanvahote.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Trà sữa Oolong đá xay",
      price: 54000,
      description: "Trà sữa Oolong đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuaolongdaxay.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Xoài đá xay",
      price: 54000,
      description: "Xoài đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/xoaidaxay.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Socola đá xay",
      price: 54000,
      description: "Socola đá xay",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/socoladaxay.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Cà phê Gong Cha",
      price: 54000,
      description: "Cà phê Gong Cha",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/cafegongcha.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 13,
      user_id: 1,
      name: "Cà phê Gong Cha kem sữa",
      price: 54000,
      description: "Cà phê Gong Cha kem sữa",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/cafegongchakemsua.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà xanh mật ong chanh tươi",
      price: 29000,
      description: "Trà xanh mật ong chanh tươi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanhmatongchanhtuoi.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa alisan",
      price: 29000,
      description: "Trà sữa alisan",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuaalisanbobapop.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà quý phi",
      price: 35000,
      description: "Trà quý phi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traquyphi.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa oolong trân châu",
      price: 29000,
      description: "Trà sữa oolong trân châu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuaolongtranchau.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa gạo nâu trân châu",
      price: 29000,
      description: "Trà sữa gạo nâu trân châu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuagaonautranchau.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa caramen",
      price: 29000,
      description: "Trà sữa caramen",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuacaramen.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà đào",
      price: 35000,
      description: "Trà đào",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/tradaobobapop.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa trân châu",
      price: 26000,
      description: "Trà sữa trân châu",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuatranchauboba.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa coffe",
      price: 26000,
      description: "Trà sữa coffe",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuacoffe.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà sữa tươi",
      price: 26000,
      description: "Trà sữa tươi",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/trasuatuoi.jpg")
    )
    Product.create!(
      category_id: 11,
      status: 0,
      shop_id: 14,
      user_id: 1,
      name: "Trà xanh Yakult đậm",
      price: 35000,
      description: "Trà xanh Yakult đậm",
      start_hour: "14:00:00",
      end_hour: "15:00:00",
      image: File.open(Rails.root + "public/images/traxanhyakultdam.jpg")
    )

  end
end
