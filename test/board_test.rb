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
    board.place(cruiser, ["A1", "A2", "A3"])
    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]
    cell_4 = board.cells["C1"]
    cell_5 = board.cells["C2"]
    board.place(submarine, ["C1", "C2"])
    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal submarine, cell_4.ship
    assert_equal submarine, cell_5.ship
    assert_equal cell_1.ship, cruiser
    assert_equal true, cell_1.ship == cell_2.ship
  end

  def test_are_the_ships_overlapping?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.ships_overlap?(submarine, ["A1", "B1"])
    assert_equal false, board.ships_overlap?(submarine, ["B1", "C1"])
  end

  def test_its_still_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(submarine, ["A1", "B1"])
    assert_equal true, board.valid_placement?(cruiser, ["C1", "C2", "C3"])
  end


  def test_that_board_is_rendered
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.render
    binding.pry
    board.place(cruiser, ["A1", "A2", "A3"])
    expected =  "  1 2 3 4 \n" +
                "A . . . . \n" +
                "B . . . . \n" +
                "C . . . . \n" +
                "D . . . . \n"

    expected_show_ship =  "  1 2 3 4 \n" +
                          "A S S S . \n" +
                          "B . . . . \n" +
                          "C . . . . \n" +
                          "D . . . . \n"

    assert_equal expected, board.render
    assert_equal expected_show_ship, board.render(true)
  end

end
