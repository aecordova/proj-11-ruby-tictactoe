# frozen_string_literal: true
class Player
  # include GameLayout

  attr_accessor :username, :x_or_o
  def initialize(username, x_or_o)
    self.username = username
    self.x_or_o = x_or_o
  end

  def winning_move?(result_table, x_or_o)
    win_moves =[[0,1,2],[3,4,5],[6,7,8],
                   [0,3,6],[1,4,7],[2,5,8],
                   [2,4,6],[0,4,8]]
    line = ''
    win_moves.each do |pos|
      pos.each do |i|
        line += result_table[i]
      end
      return true if line == x_or_o * 3
      line=''
    end
    false
  end

  def self.play(player1, player2)
  	players = {player1.x_or_o => player1.username, player2.x_or_o => player2.username}
    clear_scr
    puts fig('title')
    puts fig('div')
    result_table = Array.new(9, "")
    field = 0
    player_switch = 0
    turns_counter = 0
    display_board(build_board(result_table))
    puts "#{player1.username} you are first..."
    while true
      begin
        print "\t#{players.values[player_switch]} Choose your field ?"
        field = gets.chomp()
        if (1..9).include? field.to_i
          if result_table[field.to_i.to_i - 1] == ""
            result_table[field.to_i - 1] = players.keys[player_switch]
            clear_scr
            puts fig('title')
            puts fig('div')
            display_board(build_board(result_table))
          else
            raise "\tUsed Field!!!\n"
          end
        else
          raise "\t\tWrong entry!!!\n"
        end
      rescue StandardError=>e
        print e
        retry
      end
      if winning_move?(result_table, players.keys[player_switch])
        print "\n\t#{players.values[player_switch]} WINS!"
        exit
      end
      if turns_counter == 8
        print "\n\tDRAW GAME - NO ONE WINS!"
        exit
      end
      player_switch == 2 ? player_switch += 1 : player_switch -=1
      p turns_counter+=1
    end 
  end
end
