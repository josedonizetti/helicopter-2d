class Target extends Entity
  constructor: (x, y) ->
    super
    @x = x
    @y = y
    @width = 100
    @height = 150
    @explosion = false
    @exploded = false
    @show = true

  draw: (context) ->
    if @explosion && !@exploded
      img = document.getElementById("explosion")
      context.drawImage(img, @x, @y, @width, @height)
      @show = false
      @explosion = false
      @exploded = true
    else if @show
      img = document.getElementById("target")
      context.drawImage(img, @x, @y, @width, @height)

  update: ->
    if @intersect(game.bomb)
      @explosion = true


class Targets extends Entity
  constructor: ->
    @targets = []

    @width = 100
    @height = 150

    @x = 0
    @y = game.height - @height

    count = Math.floor(game.width / @width)
    for i in [0...count]
      @targets.push new Target(@x, @y)
      @x += @width + 5

  draw: (context) ->
    target.draw(context) for target in @targets

  update: ->
    target.update() for target in @targets

  intersect: (other) ->
    for target in @targets
      continue if target.exploded
      return true if other.intersect(target)


    false
