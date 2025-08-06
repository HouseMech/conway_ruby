# frozen_string_literal: true

# The game board for Conway's Game of life. Houses a grid of cells.
class Board
  attr_accessor :width, :height

  def initialize(width, height)
    @width = width
    @height = height

    @cells = Array.new(width) do |x|
      Array.new(height) { |y| Cell.new(x, y, self) }
    end
  end

  def cell_at(x_coord, y_coord)
    @cells[x_coord][y_coord] unless oob(x_coord, y_coord)
  end

  def neighbours_of(x_coord, y_coord)
    neighbours = []
    (-1..1).each do |x|
      (-1..1).each do |y|
        neighbours.push(cell_at(x_coord + x, y_coord + y)) unless x.zero? && y.zero?
      end
    end
    neighbours.compact
  end

  def change_cell_state(x_coord, y_coord, alive)
    cell = cell_at(x_coord, y_coord)
    return unless cell

    alive ? cell.live! : cell.die!
  end

  def oob(x_coord, y_coord)
    x_coord.negative? || x_coord > width - 1 || y_coord.negative? || y_coord > height - 1
  end

  def empty_world
    Array.new(width) do
      Array.new(height) { nil }
    end
  end

  def next_gen
    new_world = empty_world
    @cells.each do |col|
      col.each do |cell|
        dupe_cell = cell.dup
        dupe_cell.apply_conway_rules
        new_world[dupe_cell.x_coord][dupe_cell.y_coord] = dupe_cell
      end
    end
    @cells = new_world
  end
end
