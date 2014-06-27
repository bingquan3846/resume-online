$ = jQuery
@parent = if $(this).is("body") then $(window) else $(this)
@objectHeight = []
@objectTop = []
@totalNumber = 0


$.fn.flexibleBox  = (options) ->
  objects = $(this).children(".box")
  settings = $.extend {maxColumns :3,breakingWidth:[300,700,1024],minColumnWidth:"300",maxWidth:"1024",gapWidth:"10",columnWidth :0,column :4},options

  calculateColumnWith = () ->
    pwidth = $(@parent).width()

    if pwidth >= settings.maxWidth
      settings.column = settings.maxColumns
      settings.columnWidth = (settings.maxWidth - settings.maxColumns * settings.gapWidth) / settings.column
    else
      pwidth = $(window).width()
      settings.column = i+1  for breaking, i  in settings.breakingWidth when  pwidth > settings.breakingWidth[i] and pwidth < settings.breakingWidth[i+1] and settings.breakingWidth[i+1]
      settings.columnWidth = (pwidth-settings.gapWidth*settings.column) / settings.column
    null

  setCssObject = (obj, i) ->
    ratio = if $(obj).attr("data-ratio") then parseInt($(obj).attr("data-ratio")) else 0
    col = if parseInt($(obj).attr("data-column")) then parseInt($(obj).attr("data-column")) else 1

    if col >=settings.column
      col = settings.column

    #row
    k = (@totalNumber) // settings.column
    #column
    j = (@totalNumber-col) % settings.column
    console.log @totalNumber+col
    console.log (k+1)*settings.column

    if @totalNumber+col > (k+1)*settings.column
      col = (k+1)*settings.column - @totalNumber

    @totalNumber += col


    $(obj).css("position", "absolute")
    if ratio is 1
      $(obj).height(settings.columnWidth * col)
    else
      $(obj).height($(obj).attr("data-height"))


    $(obj).width(settings.columnWidth * col + settings.gapWidth * (col-1))

    @objectHeight.push parseInt($(obj).height()) for i in [1..col]


    #row
    k = (@totalNumber-1) // settings.column
    #column
    j = (@totalNumber-col) % settings.column

    $(obj).css('left', (settings.gapWidth/2) + j * settings.columnWidth + j * settings.gapWidth)
    if k isnt 0
      tops = []
      tops.push parseInt(@objectTop[@totalNumber-settings.column-n])+@objectHeight[@totalNumber-settings.column-n] for n in [col..1]
      top =  Math.max.apply(Math,tops) + parseInt(settings.gapWidth)
      $(obj).css('top', top)
      @objectTop.push top for n in [col..1]
    else
      $(obj).css('top', 0)
      @objectTop.push 0 for n in [col..1]
    console.log @objectTop
    null
  arrangeObjects = () ->
    @objectHeight = []
    @objectTop = []
    @totalNumber = 0
    setCssObject object, i for object, i in objects
    null
  process =() ->
    calculateColumnWith()
    arrangeObjects()

  process()







