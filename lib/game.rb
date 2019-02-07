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

def start_game
  # once computer places ships print the below message
  p "Computer has layed out ships on the grid."
  p "You now need to lay out your two ships."
  p "The Cruiser is two units long and the Submarine is three units long."
    p        "  1 2 3 4 "
    p        "A . . . . "
    p        "B . . . . "
    p        "C . . . . "
    p        "D . . . . "
p "Enter the squares for the Cruiser (3 spaces):"

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
