var init_stock = function()
{
  $('#stock-search').on('ajax:before', function(event, data)
  {
    show_spinner();
  });
  $('#stock-search').on('ajax:after', function(event, data)
  {
    hide_spinner();
  });
  $('#stock-search').on('ajax:success', function(event, data)
  {
    $(this).html(data);
  }).on('ajax:error', function()
  {
    hide_spinner();
    $('#stock-search-results').replaceWith(' ');
    $('#stock-search-error').replaceWith('Stock not found');
  });
}

$(document).ready(init_stock);
