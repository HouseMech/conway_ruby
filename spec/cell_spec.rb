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

    it 'has neighbours' do
      results = double
      expect(board).to receive(:neighbours_of).with(50, 50).and_return(results)
      cell.neighbours
    end

    it 'has live neighbours' do
      n1 = Cell.new(51, 50, board)
      n1.live!
      n2 = Cell.new(49, 50, board)
      results = [n1, n2]
      expect(cell).to receive(:neighbours).and_return(results)
      expect(cell.live_neighbours).to eq [n1]
    end
  end

  describe 'Rule 1' do
    before do
      cell.live!
    end
    it 'dies if it had less than 2 live neighbours, as if by underpopulation' do
      [0, 1].each do |neighbours_count|
        cell.live!
        allow(cell).to receive(:live_neighbours_count).and_return(neighbours_count)
        cell.rule1
        expect(cell.alive).to eq false
      end
    end
  end
  describe 'Rule 2' do
    it 'lives on if it has 2 or 3 live neighbours and is also alive' do
      [2, 3].each do |neighbours_count|
        cell.live!
        allow(cell).to receive(:live_neighbours_count).and_return(neighbours_count)
        cell.rule2
        expect(cell.alive).to eq true
      end
    end
  end

  describe 'Rule 3' do
    it 'dies if it has more than three live neighbours, as if by overpopulation' do

    end
  end

  describe 'Rule 4' do
    it 'revives if it has exactly 3 live neighbours, as if by reproduction' do

    end
  end
end
# rubocop:enable Metrics/BlockLength
