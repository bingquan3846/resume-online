window.Box = class Box
  constructor:(@options) ->

  setOption:(key,value) ->
    @options[key] = value
    true
  getOption:(key) ->
    @options[key]