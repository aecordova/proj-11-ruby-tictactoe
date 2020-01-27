require_relative './lib/game.rb'

RSpec.describe Game do
  describe '#winning_move?' do
    it "returns true in case the move is a winner or false if it's not" do
      game = Game.new
      results_table = ['X', 'O', 'X', 'X', 'O', 'X', 'O', 'O', 'O']
      expect(game.winning_move?(results_table, 'O')).to eql(true)
    end
  end
end