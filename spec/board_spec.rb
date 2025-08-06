# frozen_string_literal: true

require_relative '../lib/board'
# rubocop:disable Metrics/BlockLength
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

    it 'does not return a cell that is out of bounds' do
      cell = board.cell_at(100, 100)
      expect(cell).to eq nil
    end

    it 'can return the neighbours of a given cell' do
      neighbours = board.neighbours_of(0, 1)
      expect(neighbours).to be_kind_of(Array)
      expect(!neighbours.empty? && neighbours.length <= 8)
    end

    it 'can make cells alive or dead' do
      board.change_cell_state(0, 0, true)
      expect(board.cell_at(0, 0).alive?).to eq true
      board.change_cell_state(0, 0, false)
      expect(board.cell_at(0, 0).alive?).to eq false
    end
  end

  describe 'Next Gen' do
    it 'can call all of the conway rules' do
    end
  end
end
# rubocop:enable Metrics/BlockLength
