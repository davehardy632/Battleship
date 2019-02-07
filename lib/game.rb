require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class Game
  attr_reader :player_board, :computer_board
  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @@valid_coordinates = ["A1","A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  end

  def main_menu
    p "Welcome To BATTLESHIP!"
    p "Enter p to play. Enter q to quit"
    user_input = gets.chomp
    if user_input == "p"
      p "Get ready to place your ships"
      start_game
    elsif user_input == "q"
      p "user_picked q"
    else
      p "user picked something else"
    end
  end

  def computer_place_ships
  end

def quit_game
end

def start_game
  "I have laid out my ships on the grid.
  You now need to lay out your two ships.
  The Cruiser is two units long and the Submarine is three units long."
end

def start_game_2
  "Enter the squares for the Cruiser (3 spaces):"
end

  def player_place_ship
    coords = gets.chomp.split(" ")
    @player_board.place(@cruiser, coords)
  end

  def produce_random_coordinates(ship)
      possible_coordinates = []

      possible_coordinates << @valid_coordinates.sample(ship.length)
  end

  def computer_place_ships(ship)
      valid_coordinates = produce_random_coordinates(ship).flatten

  while @computer_board.valid_placement?(ship, valid_coordinates) == false
      valid_coordinates = produce_random_coordinates(ship).flatten
    end
      @computer_board.place(ship, valid_coordinates)
    end

end
