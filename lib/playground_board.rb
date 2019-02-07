require 'pry'

class Board
  attr_reader :cells
  def initialize

    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C4"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }

  end

  def valid_coordinate?(cell)
   @cells.has_key?(cell)
 end



  def valid_rows
    letter = ("A".."D").to_a
    numbers = Array.new(4,(1..4).to_a)
    numbers.map.with_index do |row, index|
      row.map do |num|
        "#{letter[index]}#{num}"
      end
    end
  end

  def valid_horizontal
    valid_rows.transpose
  end

  # def valid_backwards
  #   sets.map do |set|
  #     set.reverse

  def set_1
    valid_rows + valid_horizontal
  end

  def set_2
    set_1.map do |set|
      set.reverse
    end
  end

def valid_sets
  set_1 + set_2
  end

  def valid_placement?(ship, coords)
    validation = valid_sets.map do |set|
      if (set & coords) == coords && ship.length == cells.length
        #NEED TO ADD DIFFERENCE OF 1 in set
        true
      else
        false
      end
    end
    validation.include?(true)
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      true
      coordinates.each do |cell|
        @cells[cell].place_ship(ship)
      end
    end

end

def overlap?(ship, coords)
overlap = true



# elsif
#     ship.length == cells.length
#        true
#         else false #&& if ship.length == cells.length
#
# def valid_place?(ship, coords)
#   #if valid rows array & coordinates = valid coordinates
#   #return true
#   (valid_rows & coords) == valid_rows
#
# end
# end
#   def valid_placement?(ship, valid_coord)
#      valid_horizontal(coord) #if is a valid subset then true
#      #want to make sure this is a subset of validplacemnt and if is return true
#      valid_rows(coords) is a valid
# end
# end





#end
#
#   def valid_placement?(ship, cells)
#     if ship.length == cells.length
#       true
#     else
#       false
#
#     end
#   end
# end
#     #if ship is not placed consecutively
#     #return false
