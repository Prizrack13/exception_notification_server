@initialize_links = ->
  $('.actions a').on 'click', (e)->
    e.preventDefault()
    e.stopPropagation()
    ids = $("input[type='checkbox'][name='ids[]']").serializeArray().map((item)-> item.value)
    return if ids.length == 0
    $.ajax
      url: $(this).attr('href')
      type: $(this).data('ajax-method') || 'put'
      dataType: 'json'
      data:
        ids: ids
      success: ->
        $('.filter form').trigger('submit.rails')
$ ->
  $('body.notifications_show').each ->
    options =
      series:
        bars:
          show: true
          barWidth: 86400000
          align: 'center'
      yaxes:
        min: 0
      xaxis:
        mode: 'time',
        timeformat: "%m/%d/%y",
        tickSize: [7, 'day'],
    $('.graph').plot([$('.graph').data('values')], options)
  $('body.notifications_index').each ->
    initialize_links()
    $(document).on 'change', "input[type='checkbox'][name='ids-select-all']", ->
      $("input[type='checkbox'][name='ids[]']").prop('checked', $(this).prop('checked'))
