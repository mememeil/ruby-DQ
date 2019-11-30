require "./brave"
require "./monster"


brave = Brave.new(name: "勇者", hp: 500, offense: 200, defense: 200)
monster = Monster.new(name: "もじゃもじゃ", hp: 700, offense: 230, defense: 220)

loop do
  if brave.hp <= 0 || monster.hp <= 0
    break
  else
    brave.attack(monster)
    puts "------------------------------------"
    monster.attack(brave)
    puts "------------------------------------"
  end
end

battle_result = brave.hp > 0

if battle_result
  exp = (monster.offense + monster.defense) * 2
  gold = (monster.offense + monster.defense) * 3
  puts "#{brave.name}は戦いに勝った！"
  puts "#{exp}の経験値と#{gold}ゴールドを手に入れた！"
else
  puts "#{brave.name}は戦いに負けた…"
  puts "目の前が真っ暗になった"
end