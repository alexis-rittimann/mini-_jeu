require 'pry'


class Game
  attr_accessor :human_player, :enemies



  def initialize (name)
  		@human_player = HumanPlayer.new("#{nom}")
  		@enemies = []
  		5.times do |i|
  			@enemies << Player.new("Enemy #{i}")
  		end
  end

  def kill_player

  end


end
#binding.pry
