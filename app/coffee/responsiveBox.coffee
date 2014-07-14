jQuery.fn.responsiveBox = (options) ->
  @each (i,element) ->
    rBox = new responsiveBox($(element), options)
    rBox.process()
    true

class responsiveBox
  defaults:
    maxColumns :3,
    breakingWidth:[300,480,1024],
    possibleColumns:[2,4]
    gapWidth:"10",

  constructor: (@element,options) ->
    @options = $.extend @defaults, options
    @parent = if @element.is("body") then $(window) else @element
    @objects = @element.children(".box")
    @maxWidth = @options.breakingWidth[@options.breakingWidth.length-1]
    @maxColumns = @options.breakingWidth.length
    @column = 1
    @objectHeight = []
    @objectTop = []
    @totalNumber = 0

  initialize: ->
    @process()
  process : ->
    @calculateColumnWith()
    @arrangeObjects()
  calculateColumnWith: ->
    pwidth = @parent.width()

    #console.log pwidth
    if pwidth >= @options.breakingWidth[@options.breakingWidth.length-1]
      @column = @maxColumns
      @columnWidth = (@maxWidth - @maxColumns * @options.gapWidth) / @column
    else
      @column = i+1  for breaking, i  in @options.breakingWidth when  pwidth > @options.breakingWidth[i] and pwidth < @options.breakingWidth[i+1] and @options.breakingWidth[i+1]
      @columnWidth = (pwidth - @options.gapWidth * @column) / @column
    true
  arrangeObjects: ->
    @setCssObject object, i for object, i in @objects
    true
  setCssObject:(obj, m) ->
    ratio = if parseInt($(obj).attr("data-ratio")) then parseInt($(obj).attr("data-ratio")) else 0
    col = if parseInt($(obj).attr("data-column"))then parseInt($(obj).attr("data-column")) else 1

    if col >= @column
      col = @column

    if @totalNumber is 0
      k = 0;
    else
      #row
      k = (@totalNumber) // @column

    if @totalNumber + col > ( k + 1 ) * @column
      col = (k+1) * @column - @totalNumber

    @totalNumber += col

    $(obj).css("position", "absolute")
    if ratio is 1
      $(obj).height(@columnWidth * col)
    else
      $(obj).height($(obj).attr("data-height"))


    $(obj).width(@columnWidth * col + @options.gapWidth * (col-1))

    @objectHeight.push parseInt($(obj).height()) for i in [1..col]

    #row
    k = (@totalNumber-1) // @column
    #column
    j = (@totalNumber-col) % @column
    console.log m

    $(obj).css('left', (@options.gapWidth / 2) + j * @columnWidth + j * @options.gapWidth)
    if k isnt 0
      tops = []
      tops.push parseInt(@objectTop[@totalNumber-@column-n])+@objectHeight[@totalNumber-@column-n] for n in [col..1]
      top =  Math.max.apply(Math,tops) + parseInt(@options.gapWidth)
      $(obj).css('top', top)
      @objectTop.push top for n in [col..1]
    else
      $(obj).css('top', 0)
      @objectTop.push 0 for n in [col..1]

    if m+1 is @objects.length
      @parent.height($(obj).height() + @objectTop[m] + @options.gapWidth)
    true


