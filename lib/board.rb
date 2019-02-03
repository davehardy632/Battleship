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

  def valid_placement?(ship, coordinates)
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

  def place(ship, coordinates)


end
