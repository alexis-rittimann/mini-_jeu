require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def test_v1
  player1 = Player.new("Josiane")
  puts "À ma droite #{player1.name}"
  player2 = Player.new("José")
  puts "À ma gauche #{player2.name}"
  puts "Voici l'état de chaque joueur :"

  while player1.life_points > 0 && player2.life_points > 0
    puts"==================ATTACKS==================="
    player1.attacks(player2)
    player2.show_state
    break if player2.life_points <= 0
    puts"==================ATTACKS==================="
    player2.attacks(player1)
    player1.show_state
  end

end
test_v1
