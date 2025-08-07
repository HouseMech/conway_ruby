# frozen_string_literal: true

require_relative '../lib/board_presenter'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'BoardPresenter' do
  let(:board) { double('Board') }
  let(:presenter) { BoardPresenter.new(board) }

  describe 'Validations' do
    it 'takes a board as parameter' do
      expect(presenter.board).to eq(board)
    end

    it 'has colour for alive cells' do
      expect(presenter.alive_colour).not_to eql nil
    end

    it 'has colour for dead cells' do
      expect(presenter.dead_colour).not_to eql nil
    end
  end

  describe '#draw' do
    it 'displays a 2x2 board with mixed live and dead cells' do
      allow(board).to receive(:width).and_return(2)
      allow(board).to receive(:height).and_return(2)

      live_cell = double('Cell', alive?: true)
      dead_cell = double('Cell', alive?: false)

      allow(board).to receive(:cell_at).with(0, 0).and_return(live_cell)
      allow(board).to receive(:cell_at).with(1, 0).and_return(dead_cell)
      allow(board).to receive(:cell_at).with(0, 1).and_return(dead_cell)
      allow(board).to receive(:cell_at).with(1, 1).and_return(live_cell)

      result = presenter.draw
      expect(result).to be_a(String)
      expect(result).to include(presenter.alive_colour)
      expect(result).to include(presenter.dead_colour)
    end
  end
end
# rubocop:enable Metrics/BlockLength
