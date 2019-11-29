class Brave
  attr_reader :name
  attr_reader :defense
  attr_reader :offense
  attr_accessor :hp
  
   
  def initialize(**params)
    @name = params[:name]
    @defense = params[:defense]
    @offense = params[:offense]
    @hp = params[:hp]
  end
  
  def attack(monster)
    puts "#{@name}の攻撃"
    
    random = rand(4)
    
    if random == 0
      puts "会心の一撃！"
      calc_attack = @offense * 1.2 - monster.defense
    else
      puts "通常攻撃"
      calc_attack = @offense - monster.defense
    end
    
    damage =
      case calc_attack
      when 200..1000
        monster.hp * rand(91..100) / 100
      when 160...200
        monster.hp * rand(71..90) / 100
      when 120...160
        monster.hp * rand(51..70) / 100
      when 80...120
        monster.hp * rand(31..50) / 100
      when 40...80
        monster.hp * rand(21..30) / 100
      when 20...40
        monster.hp * rand(11..20) / 100
      when -20...20
        monster.hp * rand(5..10) / 100
      when -60...-20
        monster.hp * rand(1..4) / 100
      else
        monster.hp * rand(0..3) / 100
      end
      
      puts "random:#{random}"
      puts "calc_attack:#{calc_attack}"
      puts "damage:#{damage}"
      puts "#{monster.name}に#{damage}のダメージをあたえた！"
      puts "#{monster.name}のHPは#{monster.hp - damage}になった"
  end
end

class Monster
  attr_reader :name
  attr_reader :defense
  attr_reader :offense
  attr_accessor :hp
  
  def initialize(**params)
    @name = params[:name]
    @defense = params[:defense]
    @offense = params[:offense]
    @hp = params[:hp]
  end
  
  def attack(brave)
    puts "#{@name}の攻撃"
    
    random = rand(4)
    
    if random == 0
      puts "会心の一撃！"
      calc_attack = @offense * 1.2 - brave.defense
    else
      puts "通常攻撃"
      calc_attack = @offense - brave.defense
    end
    
    damage =
      case calc_attack
      when 200..1000
        brave.hp * rand(91..100) / 100
      when 160...200
        brave.hp * rand(71..90) / 100
      when 120...160
        brave.hp * rand(51..70) / 100
      when 80...120
        brave.hp * rand(31..50) / 100
      when 40...80
        brave.hp * rand(21..30) / 100
      when 20...40
        brave.hp * rand(11..20) / 100
      when -20...20
        brave.hp * rand(5..10) / 100
      when -60...-20
        brave.hp * rand(1..4) / 100
      else
        brave.hp * rand(0..3) / 100
      end
      
      puts "random:#{random}"
      puts "calc_attack:#{calc_attack}"
      puts "damage:#{damage}"
      puts "#{brave.name}に#{damage}のダメージをあたえた！"
      puts "#{brave.name}のHPは#{brave.hp - damage}になった"
  end
end

brave = Brave.new(name: "勇者", defense: 200, offense: 200, hp: 500)
monster = Monster.new(name: "もじゃもじゃ", defense: 220, offense: 230, hp: 700)


# puts <<-TEXT
# NAME:#{brave.name}
# HP:#{brave.hp}
# DEFENSE:#{brave.defense}
# OFFENSE:#{brave.offense}
# ------------------------------------
# NAME:#{monster.name}
# HP:#{monster.hp}
# DEFENSE:#{monster.defense}
# OFFENSE:#{monster.offense}
# TEXT

brave.attack(monster)
puts "------------------------------------"
monster.attack(brave)