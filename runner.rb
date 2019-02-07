require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'


new_game = Game.new
new_game.main_menu
puts new_game.start_game
puts new_game.player_board.render
puts new_game.start_game_2
# new_game.computer_place_ships(cruiser)
# new_game.computer_place_ships(submarine)
new_game.player_place_ship
