describe 'Box', ->
  box = new Box({"height":0,"width":2})
  it 'set option', ->
    box.setOption "height", 1
    result = box.getOption "height"
    expect(result).toBe 1
  it 'get option', ->
    result = box.getOption "width"
    expect(result).toBe 2

