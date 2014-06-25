$ = jQuery

$.fn.flexibleBox  = (options) ->
  @obj = $(this)
  @parent = if $(this).is("body") then $(window) else $(this)
  @settings = $.extend {maxColumns :3,breakingWidth:[400,700,800],minColumnWidth:"300",maxWidth:"800",gapWidth:"20"},options
  @column = @settings.maxColumns
  calculateColumnWith = () ->
    pwidth = @parent.width()
    if pwidth >= @settings.maxWidth
      @column = @settings.maxColumns
      width = (@settings.maxWidth - @settings.maxColumns * @setting.gapWidth) / @column
    else
      @column = i+1  for breaking, i  in @settings.breakingWidth when  pwidth > @settings.breakingWidth[i] and pwidth < @settings.breakingWidth[i+1] and @settings.breakingWidth[i+1]
      width = (pwidth) / @settings.columns

    width

  this

