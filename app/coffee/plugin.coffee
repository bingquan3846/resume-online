($, window, document )->
    pluginName = 'defaultPluginName'
    defaults = {propertyName: 'value'}
    ExamplePlugin = (element, options) ->
      @$element = $(element)
      @options = $.extend {},defaults,options
      @_defaults = _defaults
      @_name = pluginName
      @init()