# frozen_string_literal: true.
#!/usr/bin/env ruby
module UserInterface
  def print_title
    puts " ______  ____    __      ______   ____    __      ______   ___     ___ "
    puts "|      Tl    j  /  ]    |      T /    T  /  ]    |      T /   \\   /  _]"
    puts "|      | |  T  /  /     |      |Y  o  | /  /     |      |Y     Y /  [_ "
    puts "l_j  l_j |  | /  /      l_j  l_j|     |/  /      l_j  l_j|  O  |Y    _]"
    puts "  |  |   |  |/   \\_       |  |  |  _  /   \\_       |  |  |     ||   [_ "
    puts "  |  |   j  l\\     |      |  |  |  |  \\     |      |  |  l     !|     T"
    puts "  l__j  |____j\\____j      l__j  l__j__j\\____j      l__j   \\___/ l_____j"
                                                                           
    puts "\n==========================================================================\n"
  end
  
  def player_info
    players = {}
    puts " Enter Player 1 username?"
    players["player1"] = gets.chomp()
    puts " Enter Player 2 username?"
    players["player2"] = gets.chomp()
    puts "--------------------------"
    puts "Player1 please choose [X/O]"
    # if player 1 chooses anything else other than "r/R, x/X, o/O" we will do exception hundling
    # if player 1 chooses x/X player 2 will be o/O otherwise ...
    puts "#{players.values[0]} chooses X and #{players.values[1]} chooses O"
    players
  end

  def player_turn(players)

    player_switch = 0
    game_on=true
    while game_on 
      puts "Player #{players.values[player_switch]} turn"
      print_board #empty 1-9
      puts "Choose your field ?"
      gets.chomp()
      #check if the move is a winner
      #if winner 
       #print current player winner
       #get out
      #else
       #player_switch -= 1 if player_switch ==1
    end 

  end
end
include UserInterface
players = {}

print_title
players = player_info

game_on = true

# initial instructions for player

while game_on
  # loop for each move
  player_turn(players)

  
  if winner # and/or draw (the exact condition in this milestone is not important)
    game_on = false
  end
end