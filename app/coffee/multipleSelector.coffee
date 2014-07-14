jQuery.fn.multipleSelector = (options) ->
  @each (i,element) -> new multipleSelector($(element),options)

class multipleSelector
  defaults:
    parentSelector: 'ul'
    itemSelector: 'li'

  constructor: (@element, options) ->
    @options = _.extend @defaults, options
    @parent = @element.children(@options.parentSelector)
    @item   = @element.children(@options.itemSelector)

  initialize:->
    @item.on 'click', @switchStatus(this,event)
  switchStatus:(obj,event) =>
    event.stopPropagation() and event.preventDefault()
    if $(obj).hasClass active
      $(obj).removeClass active
