# 勇者クラスの定義
class Brave
  attr_reader :name
  attr_reader :offense
  attr_reader :defense
  attr_accessor :hp

  SP_ATTACK_CONST = 2 # 会心の一撃の時の攻撃力アップ倍率

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    puts "#{@name}の攻撃"

    #会心の一撃用のランダム数
    attack_num = rand(4)

    #4分の1の確率でsp_attackを実行
    if attack_num == 0
      puts "会心の一撃！！"
      calc_damage = sp_attack - monster.defense
    else
      puts "通常攻撃"
      calc_damage = @offense - monster.defense
    end

    damage = 0

    if calc_damage >= 0
      damage = calc_damage
      monster.hp -= calc_damage
    elsif calc_damage < 0 && calc_damage >= -100
      damage = (@offense * 0.3).floor
      monster.hp -= damage
    else
      damage = (@offense * 0.1).floor
      monster.hp -= damage
    end

    puts "#{monster.name}は#{damage}のダメージを受けた"
    puts "#{monster.name}の残りHPは#{monster.hp}になった"
  end

  def sp_attack # 勇者の攻撃力が1.5倍
    @offense * SP_ATTACK_CONST
  end
end

# モンスタークラスの定義
class Monster
  # ゲッター、セッター
  attr_reader :name
  attr_accessor :hp
  attr_reader :offense
  attr_reader :defense

  POWER_UP_RATE = 2

  # initializeメソッド 引数はhashのみの受け取り
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  # モンスターの攻撃メソッド
  def attack(brave)
    puts "#{@name}の攻撃"

    if @hp == @hp * 0.5
      puts "#{@name}は怒っている"
      puts "#{@name}の攻撃力が上がった！"
      calc_damage = sp_attack - brave.defense
    else
      puts "通常攻撃"
      calc_damage = @offense - brave.defense
    end

    damage = 0

    if calc_damage >= 0
      damage = calc_damage
      brave.hp -= calc_damage
    elsif calc_damage < 0 && calc_damage >= -100
      damage = (@offense * 0.3).floor
      brave.hp -= damage
    else
      damage = (@offense * 0.1).floor
    end

    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}になった"
  end

  def sp_attack
    @offense * POWER_UP_RATE
  end
  
end


#キーワード引数（hash）でinitializeメソッドに値を渡す
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: "もじゃもじゃ", hp: 1000, offense: 200, defense: 200)

# ヒアドキュメント:勇者
# puts <<~TEXT
# NAME:#{brave.name}
# HP:#{brave.hp}
# OFFENSE:#{brave.offense}
# DEFENSE:#{brave.defense}
# TEXT

# ヒアドキュメント:モンスター
# puts <<~TEXT
# NAME:#{monster.name}
# HP:#{monster.hp}
# OFFENSE:#{monster.offense}
# DEFENSE:#{monster.defense}
# TEXT

# ダメージでHPが減る処理
# brave.hp -= 30

# 勇者のattackメソッドの呼び出し
brave.attack(monster)

puts "----------------------------------"

# モンスターのattackメソッドの呼び出し
monster.attack(brave)