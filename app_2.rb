require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "

                         /\     /\
                        (_ \   (  \
                        (_ `\iRBNMMbn.
                         \_  \VAPRBNMMb
                           \o_)lI<= (=\
                          / `   ) , _\ )
                          )    /   (_(/
                         /_ __( \ __ _|
                            _|     |_
                   ,edMMNBRB)\ \_  /(PRBNMMbn.
                  dMMNBRPAV/o(_____)o\VAPRBNMMb
                 fMMWBRYIli\ o  o  o /rlIPRBWMMj
                 MMBRRSZIlti+._.-._.+ilIZSRRBMMM
                 /_o__o_/KZYI0lLRBNWMMMN\_o___o_\
                /_____/flZJlDYTPRKBBNWMM \ ___( \
          NNBR0PRRBNMMMMMMMlIPZSKRNWMMMV  \__._\ \
          NMBRR00PRBNNMMMMM_o___o___o__/   )_ __)o)<X>
          NMMBRR00PRRBNNMMM___o___o___/    /___/ /
          NMMBBRR00PRRBNNMM_/\_/\_/\_(  __/___x)/
          NMMBBRR00PRRBNNMM \/ \/ \/ __ )    /(`
        __NMMBBRR00PRRBNNMM_________|_ /   _')
       /__        ________        ___)(<  (====.
       \_____________________________)_\ __\---'
            VMBBR00RBNMNV           |__|\/
             lMBRR00RNMV  -
              VMB00BMNV   joris bellenger
               VMB0BMV    svzanten@xs4all.nl
                b'ger     -
                 VMV      IN ASCII ART WE TRUST
                  V       -"
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
