canvas = $('canvas')[0]
game = new Game(canvas)

game.entities = [
  game.background = new Background()
  game.targets = new Targets()
  game.helicopter = new Helicopter()
  game.bomb = new Bomb()
]

game.start()
canvas.focus()
