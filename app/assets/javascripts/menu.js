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
        type: 'DELETE',
        dataType: 'script',
      });
    }
  });
});
$(document).on('change', '#item_menu_id', function(e) {
  var menu_id = $('#item_menu_id :selected').val();
  var destroy_all = $('#destroy_all').val();
  $.ajax({
    url: '/dashboard/shops/com-tam/menus/'+ menu_id +'/item_list/new',
    type: 'GET',
    dataType: 'script',
    data: {destroy_all: destroy_all}
  })
});

$(document).on('click', '#new-item', function(e) {
  var shop_id = $('.nav-tabs li.active a').data('shop-id');
  var menu_id = $('.nav-tabs li.active a').data('menu-id');
  $.ajax({
    url: '/dashboard/shops/'+ shop_id +'/menus/'+ menu_id +'/item_list/new',
    type: 'GET',
    dataType: 'script',
  })
});

$(document).on('click', '#edit-item', function(e) {
  var shop_id = $('.nav-tabs li.active a').data('shop-id');
  var menu_id = $('.nav-tabs li.active a').data('menu-id');
  $.ajax({
    url: '/dashboard/shops/'+ shop_id +'/menus/'+ menu_id +'/item_list/new',
    type: 'GET',
    dataType: 'script',
    data: {destroy_all: true}
  })
});
