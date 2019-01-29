require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test

  def test_that_ship_exists
    ship = Ship.new("Cruiser", 3)

    assert_instance_of Ship, ship
  end

  def test_does_ship_have_a_name
    ship = Ship.new("Cruiser", 3)

    assert_equal "Cruiser", ship.name
  end

  def test_that_ship_has_health
    ship = Ship.new("Cruiser", 3)

    assert_equal 3, ship.health
  end

  def test_if_ship_is_sunk
    # testing functionality, set length to zero
    ship = Ship.new("Cruiser", 0)

    assert_equal true, ship.sunk?
  end

  def test_if_ship_is_hit
    ship = Ship.new("Cruiser", 3)
    ship.hit
    assert_equal 2, ship.health
    ship.hit
    assert_equal 1, ship.health
    ship.hit
    assert_equal true, ship.sunk?
  end


end
