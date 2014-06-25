$ = jQuery

$.fn.scrollPresentation = (options) ->
  obj = $(this)
  settings = $.extend {target : $(this)},options
