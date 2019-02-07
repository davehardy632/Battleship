
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/playground_board'
require 'pry'

class BoardTest < Minitest::Test

  def test_that_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_that_board_has_cells
    board = Board.new
    assert_equal 16, board.cells.length
  end

  def test_that_coordinates_are_valid
    board = Board.new
    assert_equal true, board.valid_coordinate?("B3")
    assert_equal true, board.valid_coordinate?("D1")
    assert_equal false, board.valid_coordinate?("C18")
    assert_equal false, board.valid_coordinate?("D5")
  end

  def test_is_can_validate_placements
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "B3", "A4"])
    assert_equal false, board.valid_placement?(cruiser, ["A1", "A3", "A4"])
    assert_equal false, board.valid_placement?(submarine, ["A2", "B3"])
    assert_equal true, board.valid_placement?(cruiser, ["A4", "A3", "A2"])


  end

end
