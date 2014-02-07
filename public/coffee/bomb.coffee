class Bomb extends Entity
  constructor: ->
    super
    @x = game.helicopter.x
    @y = game.helicopter.y + game.helicopter.height
    @xVelocity = game.helicopter.xVelocity

  update: ->
    super
    if game.keyPressed.down
      @x = game.helicopter.x + game.helicopter.width - 1
      @y = game.helicopter.y + game.helicopter.height
      @width = 20
      @height = 20
      @yVelocity = 3
      @xVelocity = 0
      game.keyPressed.down = false

  draw: (context) ->
    img = document.getElementById("bomb")
    context.drawImage(img, @x, @y, @width, @height)
