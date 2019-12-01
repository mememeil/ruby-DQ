require "./brave"
require "./monster"
require "./games_controller"

games_controller = GamesController.new

brave = Brave.new(name: "勇者", hp: 500, offense: 200, defense: 200)
monster = Monster.new(name: "もじゃもじゃ", hp: rand(400..600), offense: rand(180..220), defense: rand(190..210))

games_controller.battle(brave: brave, monster: monster)