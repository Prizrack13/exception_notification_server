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
        tickSize: [7, "day"],
    $('.graph').plot([$('.graph').data('values')], options)
