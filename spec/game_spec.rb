# frozen_string_literal: true

require '../lib/game'
require '../lib/game_layout'

RSpec.describe Game do
  describe '#winning_move?' do
    it "returns true in case the move is a winner or false if it's not" do
      game = Game.new
      game.result_table = %w[X O X X O X O O O]
      expect(game.winning_move?(game.result_table, 'O')).to eql(true)
    end
  end
end

# rubocop: disable Metrics/BlockLength, Layout/LineLength
RSpec.describe GameLayout do
  include GameLayout
  describe '#fig' do
    it 'Returns the figure related the parameters' do
      expect(fig('X', 5)).to eql(['      5      ',
                                  ' ██       ██ ',
                                  '   ██   ██   ',
                                  '     ███     ',
                                  '   ██   ██   ',
                                  ' ██       ██ '])
    end
  end

  describe '#build_board' do
    it 'returns a the result_table in a graphical format' do
      result_table = %w[X O X X O X O O O]
      expect(build_board(result_table)).to eql([[['      1      ',
                                                  " \u2588\u2588       \u2588\u2588 ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  "     \u2588\u2588\u2588     ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  " \u2588\u2588       \u2588\u2588 "],
                                                 ['      2      ',
                                                  "    \u2588\u2588\u2588\u2588\u2588    ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  " \u2588         \u2588 ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  "    \u2588\u2588\u2588\u2588\u2588    "],
                                                 ['      3      ',
                                                  " \u2588\u2588       \u2588\u2588 ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  "     \u2588\u2588\u2588     ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  " \u2588\u2588       \u2588\u2588 "]],
                                                [['      4      ',
                                                  " \u2588\u2588       \u2588\u2588 ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  "     \u2588\u2588\u2588     ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  " \u2588\u2588       \u2588\u2588 "],
                                                 ['      5      ',
                                                  "    \u2588\u2588\u2588\u2588\u2588    ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  " \u2588         \u2588 ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  "    \u2588\u2588\u2588\u2588\u2588    "],
                                                 ['      6      ',
                                                  " \u2588\u2588       \u2588\u2588 ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  "     \u2588\u2588\u2588     ",
                                                  "   \u2588\u2588   \u2588\u2588   ",
                                                  " \u2588\u2588       \u2588\u2588 "]],
                                                [['      7      ',
                                                  "    \u2588\u2588\u2588\u2588\u2588    ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  " \u2588         \u2588 ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  "    \u2588\u2588\u2588\u2588\u2588    "],
                                                 ['      8      ',
                                                  "    \u2588\u2588\u2588\u2588\u2588    ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  " \u2588         \u2588 ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  "    \u2588\u2588\u2588\u2588\u2588    "],
                                                 ['      9      ',
                                                  "    \u2588\u2588\u2588\u2588\u2588    ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  " \u2588         \u2588 ",
                                                  "  \u2588\u2588     \u2588\u2588  ",
                                                  "    \u2588\u2588\u2588\u2588\u2588    "]]])
    end

    describe '#display_board' do
      it 'Prints the board in console' do
        board = [[['      1      ',
                   " \u2588\u2588       \u2588\u2588 ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   "     \u2588\u2588\u2588     ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   " \u2588\u2588       \u2588\u2588 "],
                  ['      2      ',
                   "    \u2588\u2588\u2588\u2588\u2588    ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   " \u2588         \u2588 ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   "    \u2588\u2588\u2588\u2588\u2588    "],
                  ['      3      ',
                   " \u2588\u2588       \u2588\u2588 ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   "     \u2588\u2588\u2588     ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   " \u2588\u2588       \u2588\u2588 "]],
                 [['      4      ',
                   " \u2588\u2588       \u2588\u2588 ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   "     \u2588\u2588\u2588     ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   " \u2588\u2588       \u2588\u2588 "],
                  ['      5      ',
                   "    \u2588\u2588\u2588\u2588\u2588    ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   " \u2588         \u2588 ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   "    \u2588\u2588\u2588\u2588\u2588    "],
                  ['      6      ',
                   " \u2588\u2588       \u2588\u2588 ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   "     \u2588\u2588\u2588     ",
                   "   \u2588\u2588   \u2588\u2588   ",
                   " \u2588\u2588       \u2588\u2588 "]],
                 [['      7      ',
                   "    \u2588\u2588\u2588\u2588\u2588    ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   " \u2588         \u2588 ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   "    \u2588\u2588\u2588\u2588\u2588    "],
                  ['      8      ',
                   "    \u2588\u2588\u2588\u2588\u2588    ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   " \u2588         \u2588 ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   "    \u2588\u2588\u2588\u2588\u2588    "],
                  ['      9      ',
                   "    \u2588\u2588\u2588\u2588\u2588    ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   " \u2588         \u2588 ",
                   "  \u2588\u2588     \u2588\u2588  ",
                   "    \u2588\u2588\u2588\u2588\u2588    "]]]
        expect(display_board(board)).to eql(nil)
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength, Layout/LineLength
