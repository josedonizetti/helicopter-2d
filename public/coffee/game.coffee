class Game
  keys:
    32: 'space'
    37: 'left'
    38: 'up'
    39: 'right'
    40: 'down'

  constructor: (canvas) ->
    @context = canvas.getContext("2d")
    @width = canvas.width
    @height = canvas.height

    @keyPressed = {}

    $(canvas).on 'keydown', (e) =>
      # Convert key code to key name
      keyName = @keys[e.which]

      if keyName
        # eg.: `self.keyPressed.up = true` on keydown
        # Will be set to `false` on keyup
        @keyPressed[keyName] = e.type is 'keydown'
        e.preventDefault()

  start: ->
    fps = 60
    interval =  1000 / fps
    setInterval =>
      @update()
      @draw()
    , interval

  update: ->
    entity.update() for entity in @entities

  draw: ->
    entity.draw(@context) for entity in @entities
