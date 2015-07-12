class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(6) {Array (7.times.map{'empty'})}
  end

  def place_piece(horizontal_coord, color)
    next_empty = pick_first_empty_slot(@grid[horizontal_coord])
    if next_empty 
      @grid[0][next_empty] = color
    else
      return false
    end
  end

  def pick_first_empty_slot(column)
    column.each_with_index do |slot, index|
      return index if slot == 'empty'
    end
    return false
  end
end
