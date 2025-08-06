# frozen_string_literal: true

# A cell from conway's game of life. A cell is either dead or alive and changes states
# based on the number of live or dead neighbour cells it has.
class Cell
  attr_accessor :x_coord, :y_coord, :alive, :board

  def initialize(x_coord, y_coord, board)
    @x_coord = x_coord
    @y_coord = y_coord
    @alive = false
    @board = board
  end

  def alive?
    alive
  end

  def die!
    @alive = false
  end

  def live!
    @alive = true
  end

  def neighbours
    board.neighbours_of(x_coord, y_coord)
  end

  def live_neighbours
    neighbours.select(&:alive?)
  end

  def live_neighbours_count
    live_neighbours.count
  end

  def rule1
    die! if live_neighbours_count < 2
  end

  def rule2
    live! if live_neighbours_count == 2 || live_neighbours_count == 3
  end

  def rule3
    die! if live_neighbours_count > 3
  end

  def rule4
    live! if !alive && live_neighbours_count == 3
  end
end
