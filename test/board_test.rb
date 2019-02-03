require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
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

  # def test_that_placement_is_valid
  #
  #     board = Board.new
  #     cruiser = Ship.new("Cruiser", 3)
  #     submarine = Ship.new("Submarine", 2)
  #
  #     assert_equal ["A", "1", "A", "2", "A", "4"], board.return_flattened_array(cruiser, ["A1", "A2", "A4"])
  # end

  def test_extract_letters

    board = Board.new


    assert_equal ["A", "A", "A"], board.extract_letters(["A", "1", "A", "2", "A", "4"])
  end

  def test_extract_numbers

    board = Board.new

    assert_equal ["1", "2", "4"], board.extract_numbers(["A","1", "A", "2", "A", "4"])
  end

  def test_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    assert_equal true, board.valid_placement?(cruiser, ["A1", "A2", "A3"])

    assert_equal true, board.valid_placement?(cruiser, ["A1", "B1", "C1"])

    assert_equal false, board.valid_placement?(submarine, ["B2", "C2", "D2"])

    assert_equal true, board.valid_placement?(submarine, ["A1", "B1"])

    assert_equal false, board.valid_placement?(cruiser, ["A1", "A2", "A4"])

    assert_equal false, board.valid_placement?(submarine, ["A1", "C1"])

    assert_equal false, board.valid_placement?(cruiser, ["A3", "A2", "A1"])

    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])

    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
  end

  def test_it_cant_be_diagonal
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)



    assert_equal false,  board.valid_placement?(cruiser, ["A1", "B2", "C3"])

    assert_equal false, board.valid_placement?(submarine, ["C2", "D3"])
  end

  def test_ship_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)


  end



end
