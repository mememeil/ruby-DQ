require "./character"

# 勇者クラスの定義
class Brave < Character 
  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )

    @full_hp = params[:hp]
  end

  # 攻撃メソッド
  def attack(monster)
    # puts "#{@name}の攻撃"

    attack_type = decision_attack_type
    damage = calc_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    # attack_messageの呼び出し
    attack_message(attack_type: attack_type)
    # damage_messageの呼び出し
    damage_message(target: monster, damage: damage)

    # puts "#{monster.name}のHPは#{monster.hp}になった"
  end

  private

    def decision_attack_type
      # 会心の一撃用の乱数    
      random = rand(4)
      if random == 0
        "sp_attack"
      else
        "normal_attack"
      end
    end

    def calc_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "sp_attack"
        # puts "会心の一撃！"
        calc_attack = @offense * 1.2 - target.defense
      else
        # puts "通常攻撃"
        calc_attack = @offense - target.defense
      end
      
      # 実際のダメージ計算 defense値とoffense値で重みを算出し、敵HPから割合でダメージ値を出す
      case calc_attack
      when 200..1000
        target.full_hp * rand(91..100) / 100
      when 160...200
        target.full_hp * rand(71..90) / 100
      when 120...160
        target.full_hp * rand(51..70) / 100
      when 80...120
        target.full_hp * rand(31..50) / 100
      when 40...80
        target.full_hp * rand(21..30) / 100
      when 20...40
        target.full_hp * rand(11..20) / 100
      when -20...20
        target.full_hp * rand(5..10) / 100
      when -60...-20
        target.full_hp * rand(1..4) / 100
      else
        target.full_hp * rand(0..3) / 100
      end
    end

    def cause_damage(**params)
      target = params[:target]
      damage = params[:damage]

      target.hp -= damage

      if target.hp < 0
        target.hp = 0
      end

      # puts "#{monster.name}に#{damage}のダメージをあたえた！"
    end

end