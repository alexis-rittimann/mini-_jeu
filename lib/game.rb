require 'pry'


class Game
  attr_accessor :human_player, :enemies



  def initialize (name)
    puts "pseudo du joueur"
    nom = gets.chomp
  	@human_player = HumanPlayer.new("#{nom}")
  	@enemies = []
  	5.times do |i|
  		@enemies << Player.new("Enemy #{i}")
  	end
  end

  def kill_player(player)
    if player.life_points <= 0
      enemies.delete_at(player)
    end
  end


end
#binding.pry
