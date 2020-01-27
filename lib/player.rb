# frozen_string_literal: true

# Class for controlling the instances of the players
class Player
  attr_accessor :username, :x_or_o
  def initialize(username, x_or_o)
    self.username = username
    self.x_or_o = x_or_o
  end
end
