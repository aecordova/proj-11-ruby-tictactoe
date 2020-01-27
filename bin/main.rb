#frozen_string_literal: true.
#!/usr/bin/env ruby
require './lib/player.rb'
require './lib/game_layout.rb'
module UserInterface
  include GameLayout
  def player_info(player1, player2)
    proceed_or_quit = ""
    print "\n\tEnter Player 1 username? "
    player1.username = gets.chomp()
    print "\n\n\tEnter Player 2 username? "
    player2.username = gets.chomp()
    puts fig('div')
    begin
      print "\n\tPlayer1 please choose [X/O] "
      player1.x_or_o = gets.chomp().upcase
      if ["X", "O"].include? player1.x_or_o
        if player1.x_or_o == "X" then
          player2.x_or_o = "O"
        else
          player1.username, player2.username = player2.username, player1.username
          player1.x_or_o = "X"
          player2.x_or_o = "O"
        end
        return 
      end
      raise "\n\t\tplease choose only 'X' or 'O'..."
    rescue StandardError=>e
      puts e
      sleep 1
      print "\nTrying one more time?\t"
      begin
        sleep 1
        print "press 'Enter' to proceed...\tOr "
        sleep 2
        puts "press 'q' to quit "
        proceed_or_quit = gets.chomp
        if ["", "Q"].include? proceed_or_quit.upcase
          if proceed_or_quit.upcase == "Q"
            print "\nGame is quiting "
            print "in 3..."
            sleep 1
            print "2..."
            sleep 1
            print "1..."
            sleep 1
            exit
          else
            retry
          end
        end
        raise "\t\t\t<== Wrong input!!!"
      rescue StandardError=>e
        puts e
        retry
      end
    end
  end
end

include UserInterface
player1 = Player.new("", "")
player2 = Player.new("", "")

puts fig('title')
puts fig('div')
player_info(player1, player2)
Player.play(player1, player2)
