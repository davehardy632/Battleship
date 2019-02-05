require 'pry'

class Board
  attr_reader :cells, :extract_letters, :extract_numbers
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

  def return_flattened_array(coordinates)
    coordinates = coordinates.map do |cell| cell.split(//)
    end
    coordinates = coordinates.flatten
  end

  def extract_numbers(coordinates)
    numbers = coordinates.select do |element| coordinates.index(element).odd?
    end
  end

  def extract_letters(coordinates)
    letters = coordinates.select do |element|
      coordinates.index(element).even?
    end
  end

  def ships_overlap?(ship, coordinates)
    coordinates.map do |coordinate|
      @cells[coordinate]
    end.any? { |cell| cell.occupied? }
  end

  def valid_placement?(ship, coordinates)
    if ships_overlap?(ship, coordinates)
      return false
    else
    coordinates = return_flattened_array(coordinates)
    letter_box = ["A", "B", "C", "D", "E", "F", "G", "H", "I"].join
    number_box = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].join
    letters = extract_letters(coordinates).join
    numbers = extract_numbers(coordinates).join
    if letters.count(letters[0]) == ship.length
      if number_box.include?(numbers) == true
        true
      else false
      end
    elsif numbers.count(numbers[0]) == ship.length
      if letter_box.include?(letters) == true
        true
      else false
      end
    else false
    end
  end
end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      true
      coordinates.each do |cell|
        @cells[cell].place_ship(ship)
      end
    end
  end


  def render(hidden = false)
    p "  1 2 3 4 \n" +
     "A #{@cells["A1"].render(hidden)} #{@cells["A2"].render(hidden)} #{@cells["A3"].render(hidden)} #{@cells["A4"].render(hidden)} \n" +
     "B #{@cells["B1"].render(hidden)} #{@cells["B2"].render(hidden)} #{@cells["B3"].render(hidden)} #{@cells["B4"].render(hidden)} \n" +
     "C #{@cells["C1"].render(hidden)} #{@cells["C2"].render(hidden)} #{@cells["C3"].render(hidden)} #{@cells["C4"].render(hidden)} \n" +
     "D #{@cells["D1"].render(hidden)} #{@cells["D2"].render(hidden)} #{@cells["D3"].render(hidden)} #{@cells["D4"].render(hidden)} \n"
  end

end
