# frozen_string_literal: true

# Draws the display for Conway's game of life
class BoardPresenter
  attr_accessor :board, :alive_colour, :dead_colour

  def initialize(board, alive_colour = '0;128;0', dead_colour = '128;128;128')
    @board = board
    @alive_colour = alive_colour
    @dead_colour = dead_colour
  end

  def draw
    clear_terminal
    output = ''
    0.upto(board.height - 1) do |y|
      0.upto(board.width - 1) do |x|
        cell = board.cell_at(x, y)
        output += dead_or_alive(cell)
        output += ' ' unless x == board.width - 1
      end
      output += "\n"
    end
    output
  end
end

def clear_terminal
  puts "\e[H\e[2J"
end

def colorize(string, rgb_values)
  "\e[38;2;#{rgb_values}m#{string}\e[0m"
end

def dead_or_alive(cell)
  cell.alive? ? colorize('*', alive_colour) : colorize(' ', dead_colour)
end
