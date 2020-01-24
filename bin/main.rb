#frozen_string_literal: true.
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
      when 'pad'
       '             '
      when 'div'
      "\n═════════════════════════════════════════════════════════════════════════\n\n"
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
        line+= fig('pad')
        0.upto(board[lane].length - 1) do |col|
          line += board[lane][col][row]
          line += fig('vbar') unless col == 2
          line += "\n" unless col < 2
        end
        line += (fig('pad')+fig('hbar')) if row == 5 && lane < 2
      end
    end
    print line
  end

  def clear_scr
    system 'clear'
    system 'cls'
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

  def player_turn(players)
    clear_scr
    puts fig('title')
    puts fig('div')
    result_table = Array.new(9, "")
    field = 0
    player_switch = 2
    turns_counter = 0
    display_board(build_board(result_table))
    puts "#{players["X"]} you are first..."
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
include UserInterface
players = {}

puts fig('title')
puts fig('div')
players = player_info
player_turn(players)

#  choices = ['X','X','X','','','','','','']
#  puts winning_move?(choices, 'X')
