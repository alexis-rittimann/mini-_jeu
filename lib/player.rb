require 'pry'


class Player
  attr_accessor :name, :life_points

  def initialize(name, life_points=10)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    puts "le joueur #{@name} a été tué !" if @life_points <= 0
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}"
    a = compute_damage
    player.gets_damage(a)
    puts "il lui inflige #{a} points de dommages"
  end

  def compute_damage
   return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :name, :life_points, :weapon_level

  def initialize(name, life_points=100)
    @name = name
    @life_points = life_points
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dé = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dé}"
    if dé > @weapon_level
      @weapon_level = dé
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    dé = rand(1..6)
    if dé = 1
      puts "Tu n'as rien trouvé... "
    elsif dé > 1 && dé < 6
      @life_points += 50
      @life_points = 100 if @life_points > 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
      @life_points = 100 if @life_points > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end
