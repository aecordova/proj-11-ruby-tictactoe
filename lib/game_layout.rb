# frozen_string_literal: true

# This module is about printing diffrent game elements
module GameLayout
  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/MethodLength, Layout/LineLength
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
  # rubocop: enable Metrics/CyclomaticComplexity, Metrics/MethodLength, Layout/LineLength

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

  # rubocop: disable Metrics/AbcSize, Metrics/MethodLength
  def display_board(board)
    line = ''
    0.upto(board.length - 1) do |lane|
      0.upto(5) do |row|
        line += fig('pad')
        0.upto(board[lane].length - 1) do |col|
          line += board[lane][col][row]
          line += fig('vbar') unless col == 2
          line += "\n" unless col < 2
        end
        line += (fig('pad') + fig('hbar')) if row == 5 && lane < 2
      end
    end
    print line
  end
  # rubocop: enable Metrics/AbcSize, Metrics/MethodLength

  def clear_scr
    system 'clear'
    system 'cls'
  end
end
