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

     assert_nil nil, cell.ship
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
     cell.ship
     assert_equal cruiser, cell.ship
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

     assert_equal 1, cell.ship.health
   end

   def test_if_ship_is_fired_upon
     cell = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell.place_ship(cruiser)
     cell.fire_upon

     assert_equal true, cell.fired_upon?
   end

   def test_if_cell_1_is_a_cell
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)

     assert_instance_of Cell, cell_1
   end

   def test_if_cell_1_renders
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)

     cell_1.fire_upon
     assert_equal "M", cell_1.render
   end

   def test_if_cell_renders_H
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell_1.place_ship(cruiser)
     cell_1.fire_upon

     assert_equal "H", cell_1.render
   end

   def test_that_cell_has_not_been_fired_upon
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell_1.place_ship(cruiser)
     assert_equal ".", cell_1.render
   end

   def test_if_ship_is_sunk_in_cell
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell_1.place_ship(cruiser)
     cell_1.fire_upon
     cell_1.fire_upon
     cell_1.fire_upon

     assert_equal "X", cell_1.render
   end

   def test_that_ship_is_revealed
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell_1.place_ship(cruiser)

     assert_equal "S", cell_1.render(true)
   end

   def test_cruiser_sunk?
     cell_1 = Cell.new("B4")
     cruiser = Ship.new("Cruiser", 3)
     cell_1.place_ship(cruiser)
     cell_1.fire_upon

     assert_equal false, cruiser.sunk?
     cell_1.fire_upon
     cell_1.fire_upon
     assert_equal true, cruiser.sunk?
   end
 end
