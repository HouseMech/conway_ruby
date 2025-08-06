# frozen_string_literal: true

require_relative '../lib/cell'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Cell' do
  let(:board) { double(:board) }
  let(:cell) { Cell.new(50, 50, board) }

  describe 'Validations' do
    it 'has an x and y coordinate' do
      expect(cell.x_coord).to eql 50
      expect(cell.y_coord).to eql 50
    end

    it 'is either alive or dead' do
      expect(([true, false].include? cell.alive)).to eql true
    end

    it 'can die' do
      cell.die!
      expect(cell.alive).to eql false
    end

    it 'can rise from the grave!' do
      cell.live!
      expect(cell.alive).to eql true
    end
  end

  describe 'Game Logic' do
    it 'has neighbours' do
      results = double
      expect(board).to receive(:neighbours_of).with(50, 50).and_return(results)
      cell.neighbours
    end
  end
end
# rubocop:enable Metrics/BlockLength
