# frozen_string_literal: true

require_relative '../lib/board'

RSpec.describe 'Board' do
  let(:board) { Board.new(10, 20) }

  describe 'Validations' do
    it 'has a width and height' do
      expect(board.width).to eq 10
      expect(board.height).to eq 20
    end
  end

  describe 'Functions' do
    it 'can return a cell at a given position' do
      cell = board.cell_at(0, 1)
      expect(cell).to be_kind_of(Cell)
      expect(cell.x_coord).to eq 0
      expect(cell.y_coord).to eq 1
    end

    it 'can return the neighbours of a given cell' do
      neighbours = board.neighbours_of(0,1)
      expect(neighbours).to be_kind_of(Array)
      expect(neighbours.!empty && neighbours.length <= 8)
    end
  end
end
