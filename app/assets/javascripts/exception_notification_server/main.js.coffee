@initialize_sparkline = ->
  $('.sparkline').each ->
    $(this).sparkline $(this).data('values'),
      {type: $(this).data('type') || 'line'}
$ ->
  initialize_sparkline()
