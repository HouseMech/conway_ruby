# frozen_string_literal: true

require_relative '../lib/cell'

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
  end
end
