# frozen_string_literal: true

# Class for controlling the instances of the game through the gameplay
# and deciding the victor
class Game
  attr_accessor :result_table, :turns_counter, :field
  def initialize
    self.result_table = Array.new(9, '')
    self.turns_counter = 0
    self.field = 0
  end

  def winning_move?(result_table, x_or_o)
    win_moves = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                 [2, 5, 8], [2, 4, 6], [0, 4, 8]]
    win_moves.each do |pos|
      line = ''
      pos.each do |i|
        line += result_table[i]
      end
      return true if line == x_or_o * 3
    end
    false
  end
end
