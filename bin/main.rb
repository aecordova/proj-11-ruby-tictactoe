# frozen_string_literal: true.
#!/usr/bin/env ruby
module UserInterface
  
  def player_info
    players = {}
    x_or_o = ""
    proceed_or_quit = ""
    print "\n\tEnter Player 1 username? "
    players["player1"] = gets.chomp()
    print "\n\n\tEnter Player 2 username? "
    players["player2"] = gets.chomp()
    puts fig('div')
    begin
      print "\n\tPlayer1 please choose [X/O] "
      x_or_o = gets.chomp()
      if ["X", "O"].include? x_or_o.upcase
        if x_or_o.upcase == "X"
          players["X"] = players["player1"] # X is always key number 3 in hash
          players["O"] = players["player2"] # O is always key number 4 in hash
        else
          players["X"] = players["player2"]
          players["O"] = players["player1"]
        end
        return players
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

  def fig(which, ind = nil)
    case which
    when 'title'
      [' ______  ____    __      ______   ____    __      ______   ___     ___ ',
       '|      Tl    j  /  ]    |      T /    T  /  ]    |      T /   \\   /  _]',
       '|      | |  T  /  /     |      |Y  o  | /  /     |      |Y     Y /  [_ ',
       'l_j  l_j |  | /  /      l_j  l_j|     |/  /      l_j  l_j|  O  |Y    _]',
       '  |  |   |  |/   \\_       |  |  |  _  /   \\_       |  |  |     ||   [_ ',
       '  |  |   j  l\\     |      |  |  |  |  \\     |      |  |  l     !|     T',
       '  l__j  |____j\\____j      l__j  l__j__j\\____j      l__j   \\___/ l_____j']
    when 'div'
      "\n###########################################################################\n"
    when 'vbar'
      ' ║ '
    when 'hbar'
      "══════════════╬═══════════════╬══════════════\n"
    when 'X'
      ["      #{ind}      ",
       ' ██       ██ ',
       '   ██   ██   ',
       '     ███     ',
       '   ██   ██   ',
       ' ██       ██ ']
    when 'O'
      ["      #{ind}      ",
       '    █████    ',
       '  ██     ██  ',
       ' █         █ ',
       '  ██     ██  ',
       '    █████    ']
    else
      ["      #{ind}      ",
       '             ',
       '             ',
       '             ',
       '             ',
       '             ']
    end
  end

  def build_board(choices)
    line = []
    board = []
    0.upto(choices.length) do |i|
      line << fig(choices[i], i + 1)
      if ((i + 1) % 3).zero?
        board << line
        line = []
      end
    end
    board
  end

  def display_board(board)
    line = ''
    0.upto(board.length - 1) do |lane|
      0.upto(5) do |row|
        0.upto(board[lane].length - 1) do |col|
          line += board[lane][col][row]
          line += fig('vbar') unless col == 2
          line += "\n" unless col < 2
        end
        line += fig('hbar') if row == 5 && lane < 2
      end
    end
    print line
  end

  # def winning_move(result_table, chosen_field)
  #   turns_counter = 0
  #   do
  #     if result_table[chosen_field]
  #   while turns_counter != 9 # 9 turns in total
  #   turns_counter
  # end  

  def player_turn(players)
    result_table = Array.new(9, "")
    field = 0
    player_switch = 2
    turns_counter = 0
    puts "#{players["X"]} you are first..."
    display_board(build_board(result_table))
    while true
      begin
        print "\t#{players.values[player_switch]} Choose your field ?"
        field = gets.chomp()
        if (1..9).include? field.to_i
          if result_table[field.to_i.to_i - 1] == ""
            result_table[field.to_i - 1] = players.keys[player_switch]
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
      # turns_counter = winning_move(result_table, field)
      # exit if turns_counter == 9
      player_switch == 2 ? player_switch += 1 : player_switch -=1
    end 
  end
end
include UserInterface
players = {}

puts fig('title')
puts fig('div')
players = player_info
player_turn(players)

