var init_stock = function()
{
  $('#stock-search-id').on('ajax:success', function(event, data, status)
  {
    $('#stock-search').replaceWith(data);
    init_stock();
  });

  $('#stock-search-id').on('ajax:error', function(event, xhr, status, error)
  {
    $('#stock-search-error').replaceWith('Stock not found');
  });
}

$(document).ready(init_stock);
