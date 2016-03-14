var init_stock = function()
{
  $('#stock-search').on('ajax:success', function(event, data)
  {
    $(this).html(data);
  }).on('ajax:error', function()
  {
    $('#stock-search-error').replaceWith('Stock not found');
  });
}

$(document).ready(init_stock);
