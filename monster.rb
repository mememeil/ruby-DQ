require "./character"

#モンスタークラスの定義
class Monster < Character
  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
    )

    @is_angry_flag = false
    @half_hp = params[:hp] * 0.5
    @full_hp = params[:hp]
  end
  
  def attack(brave)
    # モンスターが怒り状態かどうか判定:HPが半分以下になると発動
    is_angry

    attack_type = decision_attack_type
    damage = calc_damage(target: brave, attack_type: attack_type)
    cause_damage(target: brave, damage: damage)

    # attack_messageの呼び出し
    attack_message(attack_type: attack_type)
    # damage_messageの呼び出し
    damage_message(target: brave, damage: damage)
    
  end

  private

    def is_angry
      if @hp <= @half_hp && @is_angry_flag == false
        @is_angry_flag = true
        #change_classメソッドでモンスターが強化される
        change_class
      end
    end
  
    def change_class
      change_class_name = "もじゃもじゃキング"

      # change_class_messageの呼び出し
      change_class_message(origin_name: @name, change_class_name: change_class_name)

      @offense *= 1.2
      @name = change_class_name
    end

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
      
      # puts "#{brave.name}に#{damage}のダメージをあたえた！"
    end

end