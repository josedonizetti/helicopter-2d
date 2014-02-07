class Helicopter extends Entity
  constructor: ->
    super
    @width = 40
    @height = 40

    @x = -@width
    @y = 10

    @xVelocity = 3
    @yVelocity = 0

  update: ->
    super
    if @x > game.width
      @x = -@width
      @y += @height
      @xVelocity *= 1.1

  draw: (context) ->
    if game.targets.intersect(this)
      explosion = document.getElementById("explosion")
      context.drawImage(explosion, @x, @y, @width, @height)
      @yVelocity = 5
    else
      helicopter = document.getElementById("helicopter")
      context.drawImage(helicopter,@x,@y, @width, @height);

