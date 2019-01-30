require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require 'pry'

class CellTest < Minitest::Test

  def test_that_cell_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end

  def test_that_coordinate_exists
    cell = Cell.new("B4")

    assert_equal "B4", cell.coordinate
  end

  def test_that_cell_is_not_occupied_by_ship
     cell = Cell.new("B4")

     assert_equal nil, cell.ship
   end

   def test_cell_is_empty
     cell = Cell.new("B4")

     assert_equal true, cell.empty?
   end

   def test_that_ship_exists
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)

     assert_instance_of Ship, cruiser
   end

   def test_ship_covers_coordinate
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell.place_ship(cruiser)
     assert_equal cruiser, cell.ship
   end

   def test_if_cell_has_a_ship_or_is_empty
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell.place_ship(cruiser)
     # cell.ship
     assert_equal false, cell.empty?
   end

   def test_that_cell_is_fired_upon?
     cell = Cell.new("B4")

     assert_equal false, cell.fired_upon?
   end

   def test_that_ship_has_been_fired_upon
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell.place_ship(cruiser)
     cell.fire_upon
     cell.fire_upon

     assert_equal 1, cruiser.health
   end

   def test_that_being_fired_upon_returns_boolean
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell.place_ship(cruiser)
     cell.fire_upon
    
     assert_equal true, cell.fired_upon?
   end


end
