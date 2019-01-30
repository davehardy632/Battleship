require 'pry'

class Cell
  attr_reader :coordinate, :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end


  def fire_upon
    if empty? == false
      @ship.health -= 1
      @fired_upon = true
    else
    end
  end





end
