$(document).on('click', '[data-destroy="item"]', function(e) {
  e.preventDefault();
  var url = $(this).attr('href');
  var item_name = $(this).data('item-name');
  swal({
    customClass: 'custom-swal',
    title: I18n.t('common.notifications'),
    text: I18n.t('confirm_delete_item', {item_name: item_name}),
    showCancelButton: true,
    confirmButtonColor: '#ff5722',
    confirmButtonText: I18n.t('submit'),
    cancelButtonText: I18n.t('cancel'),
    closeOnCancel: true
  }, function(confirmed) {
    if(confirmed) {
      $.ajax({
        url: url,
        type: "DELETE",
        dataType: "script",
      });
    }
  });
});
