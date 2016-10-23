$ ->
  window.carts = {}
  window.carts.selectableDays = []

  for selctable_day, i in $(".datepicker").data('selectable-days')
    window.carts.selectableDays.push(new Date(selctable_day).toDateString())

  $(".datepicker").datepicker(
    dateFormat: 'yy-mm-dd'
    beforeShowDay: (date) ->
      return [window.carts.selectableDays.indexOf(date.toDateString()) >= 0, ""]
  )
