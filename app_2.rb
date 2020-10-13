require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "pseudo du joueur"
nom = gets.chomp

human_player = HumanPlayer.new("#{nom}")
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
  human_player.show_state
  puts "=================choix=================="
  puts "Quelle action veux-tu effectuer ?\n\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner\n\n"

  puts "attaquer un joueur en vue :"
  print "0 - "
  print "#{player1.show_state}"
  print "1 - "
  print "#{player2.show_state}"
  result = gets.chomp

  if result == "a"
    puts "===================ACTION==================="
    human_player.search_weapon
  elsif result == "s"
    puts "===================ACTION==================="
    humain_player.search_health_pack
  elsif result == "0"
    puts "==================ATTACKS==================="
    human_player.attacks(player1)
  elsif result == "1"
    puts "==================ATTACKS==================="
    human_player.attacks(player2)
  end
  puts "==================ENEMIES==================="

  puts"Les autres joueurs t'attaquent !"
  enemies.each do |i|
    if i.life_points > 0
      i.attacks(human_player)
    end
  end

end

puts "====================END====================="
if human_player.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
