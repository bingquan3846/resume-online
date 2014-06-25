$ = jQuery

$.fn.scrollPresentation = (options) ->
  @obj = $(this)
  @$element       = if $(element).is('body') then  $(window) else $(element)
  @$body          = $('body')
  @$scrollElement = @$element.on('scroll.bs.scroll-spy.data-api', process)
  @settings = $.extend {selector : this},options
  getScrollHeight = () ->
    @$scrollElement.scrollTop()
  #get targets id
  fetchTargets = () ->
    targetId = []
    $(@settings.selector).children("a").each ->
      targetId.push $(this).attr("data")
    targetId
  fetchObjects = (targets) ->
    @objects.push $("#"+target) for target in targets
    @objects
  activeObject = (i) ->
    @objects.removeClass "active"
    $(@objects[i]).addClass "active"
    true
  process = () ->
    height = getScrollHeight()
    activeObject object,i for i in @objects when object.position.top() < height and @objects[i+1].position.top() > height
    true
  targets = fetchTargets()
  fetchObjects(targets)