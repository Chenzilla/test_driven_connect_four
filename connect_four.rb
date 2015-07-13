class Board
  attr_reader :grid, :game_status

  def initialize
    @height = 6
    @width = 7
    @grid = Array.new(@width) {Array (@height.times.map{'empty'})}
  end

  def place_piece(horizontal_coord, color)
    next_empty = pick_first_empty_slot(@grid[horizontal_coord])
    if next_empty 
      @grid[horizontal_coord][next_empty] = color
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

  def game_over?
    vertical_count = 1
    @grid.each_with_index do |column, column_index|
      column.each_with_index do |slot, slot_index|
        if slot_index != 0 && slot == column[slot_index - 1] && slot != 'empty'
          vertical_count += 1
          return true if vertical_count == 4
        else 
          vertical_count = 1
        end
      end
    end
    return false
  end
end


