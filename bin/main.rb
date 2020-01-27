# frozen_string_literal: true

# !/usr/bin/env ruby
require_relative '../lib/player.rb'
require_relative '../lib/game_layout.rb'
require_relative '../lib/game.rb'
module UserInterface
  include GameLayout
  def player_info(player1, player2)
    proceed_or_quit = ''
    print "\n\tEnter Player 1 username? "
    player1.username = gets.chomp
    print "\n\n\tEnter Player 2 username? "
    player2.username = gets.chomp
    puts fig('div')
    begin
      print "\n\tPlayer1 please choose [X/O] "
      player1.x_or_o = gets.chomp.upcase
      if %w[X O].include? player1.x_or_o
        if player1.x_or_o == 'X'
          player2.x_or_o = 'O'
        else
          player1.username, player2.username = player2.username, player1.username
          player1.x_or_o = 'X'
          player2.x_or_o = 'O'
        end
        return
      end
      raise "\n\t\tplease choose only 'X' or 'O'..."
    rescue StandardError => e
      puts e
      sleep 1
      print "\nTrying one more time?\t"
      begin
        sleep 1
        print "press 'Enter' to proceed...\tOr "
        sleep 2
        puts "press 'q' to quit "
        proceed_or_quit = gets.chomp
        if ['', 'Q'].include? proceed_or_quit.upcase
          if proceed_or_quit.upcase == 'Q'
            print "\nGame is quiting "
            print 'in 3...'
            sleep 1
            print '2...'
            sleep 1
            print '1...'
            sleep 1
            exit
          else
            retry
          end
        end
        raise "\t\t\t<== Wrong input!!!"
      rescue StandardError => e
        puts e
        retry
      end
    end
  end

  def game_play(game, player1, player2)
    players = { player1.x_or_o => player1.username,
                player2.x_or_o => player2.username }
    clear_scr
    puts fig('title')
    puts fig('div')
    player_switch = 0
    display_board(build_board(game.result_table))
    puts "#{player1.username} you are first..."
    loop do
      begin
        print "\t#{players.values[player_switch]} Choose your field ?"
        game.field = gets.chomp
        raise "\t\tWrong entry!!!\n" unless (1..9).include? game.field.to_i
        unless game.result_table[game.field.to_i - 1] == ''
          raise "\tUsed Field!!!\n"
        end

        game.result_table[game.field.to_i - 1] = players.keys[player_switch]
        clear_scr
        puts fig('title')
        puts fig('div')
        display_board(build_board(game.result_table))
      rescue StandardError => e
        print e
        retry
      end
      if game.winning_move?(game.result_table, players.keys[player_switch])
        print "\n\t#{players.values[player_switch]} WINS!"
        exit
      end
      if game.turns_counter == 8
        print "\n\tDRAW GAME - NO ONE WINS!"
        exit
      end
      player_switch.zero? ? player_switch += 1 : player_switch -= 1
      game.turns_counter += 1
    end
  end
end

include UserInterface
player1 = Player.new('', '')
player2 = Player.new('', '')
game = Game.new

puts fig('title')
puts fig('div')
player_info(player1, player2)
game_play(game, player1, player2)
