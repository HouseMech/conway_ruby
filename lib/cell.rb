# frozen_string_literal: true

# A cell from conway's game of life. A cell is either dead or alive and changes states
# based on the number of live or dead neighbour cells it has.
class Cell
  attr_accessor :x_coord, :y_coord, :alive, :board

  def initialize(x,y,board)
    @x_coord = x
    @y_coord = y
    @alive = false
    @board = board
  end

  def die!
    @alive = false
  end

  def live!
    @alive = true
  end

  def neighbours
    []
  end
end
