describe 'Box', ->
  box = null
  objects = []
  beforeEach ->
    box = new Box({"height":0,"top":2})

  it 'set option', ->
    box.setOption "height", 1
    result = box.getOption "height"
    expect(result).toBe 1
  it 'get option', ->
    result = box.getOption "top"
    expect(result).toBe 2
  it 'test objects', ->
    objects = pushObject box
    expect(objects.length).toBe 1


