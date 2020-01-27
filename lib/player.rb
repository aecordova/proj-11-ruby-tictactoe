# frozen_string_literal: true

require_relative 'game_layout.rb'

# Class for controlling the flow of the game and  returning instances
# of the players
class Player
  include GameLayout

  attr_accessor :username, :x_or_o
  def initialize(username, x_or_o)
    self.username = username
    self.x_or_o = x_or_o
  end

  def self.winning_move?(result_table, x_or_o)
    win_moves = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7],
                 [2, 5, 8], [2, 4, 6], [0, 4, 8]]
    # line = ''
    win_moves.each do |pos|
      line = ''
      pos.each do |i|
        line += result_table[i]
      end
      return true if line == x_or_o * 3
    end
    false
  end

  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize

  def self.play(player1, player2)
    players = { player1.x_or_o => player1.username,
                player2.x_or_o => player2.username }
    clear_scr
    puts fig('title')
    puts fig('div')
    result_table = Array.new(9, '')
    field = 0
    player_switch = 0
    turns_counter = 0
    display_board(build_board(result_table))
    puts "#{player1.username} you are first..."
    loop do
      begin
        print "\t#{players.values[player_switch]} Choose your field ?"
        field = gets.chomp
        # if (1..9).include? field.to_i
        raise "\t\tWrong entry!!!\n" unless (1..9).include? field.to_i
        raise "\tUsed Field!!!\n" unless result_table[field.to_i.to_i - 1] == ''

        # if result_table[field.to_i.to_i - 1] == ""
        result_table[field.to_i - 1] = players.keys[player_switch]
        clear_scr
        puts fig('title')
        puts fig('div')
        display_board(build_board(result_table))
        # else
        #   raise "\tUsed Field!!!\n"
        # end
        # else
        #   raise "\t\tWrong entry!!!\n"
        # end
      rescue StandardError => e
        print e
        retry
      end
      if Player.winning_move?(result_table, players.keys[player_switch])
        print "\n\t#{players.values[player_switch]} WINS!"
        exit
      end
      if turns_counter == 8
        print "\n\tDRAW GAME - NO ONE WINS!"
        exit
      end
      player_switch.zero? ? player_switch += 1 : player_switch -= 1
      turns_counter += 1
    end
  end
end
# rubocop: enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/AbcSize
