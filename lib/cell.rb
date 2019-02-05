require 'pry'

class Cell
  attr_reader :coordinate, :ship, :fired_upon, :empty
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @empty = true
  end

  def empty?
    @empty
  end

  def place_ship(ship)
    @ship = ship
    @empty = false
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if @empty == false
      @ship.hit
    end
    @fired_upon = true
  end

  def render(hidden = false)
    if @fired_upon == false && hidden == false
      p "."
    elsif @fired_upon == false && hidden == true && empty? == true
      p "."  
    elsif @fired_upon == true && empty? == true
      p "M"
    elsif @fired_upon == true && empty? == false && @ship.sunk? == false
      p "H"
    elsif @fired_upon == true && @ship.sunk? ==  true
      p "X"
    elsif @fired_upon == false && hidden == true && empty? == false
      p "S"
    end
  end
end
