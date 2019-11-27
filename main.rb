# 勇者クラスの定義
class Brave
  # attr_readerでゲッターの置換
  attr_reader :name
  attr_reader :offense
  attr_reader :defense

  # attr_accessorで:hpのゲッターとセッターをまとめる
  # 残りのステータスは書き換え不要なのでゲッターのみでOK
  attr_accessor :hp

  # initializeメソッド 引数に**を記述:ハッシュしか受け取れなくなる
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def attack(monster)
    # @offense:勇者の攻撃力
    # monster.defense:モンスターの防御力
    # ダメージ判定計算
    calcDamage = @offense - monster.defense
    # 実際のダメージ用変数
    damage = 0

    # モンスターのHPから計算したダメージを引く
    # calcDamageがマイナス（勇者の攻撃力<モンスターの防御力）の場合、攻撃力に割合をかけて減算
    if calcDamage >= 0
      damage = calcDamage
      monster.hp -= calcDamage
    elsif calcDamage < 0 && calcDamage >= -100
      damage = (@offense * 0.15).floor
      monster.hp -= damage
    else
      damage = (@offense * 0.05).floor
      monster.hp -= damage
    end

    # メッセージ表示
    puts "#{@name}の攻撃"
    puts "#{monster.name}は#{damage}のダメージを受けた"
    puts "#{monster.name}の残りHPは#{monster.hp}になった"
  end
end

# モンスタークラスの定義
class Monster
  # ゲッター、セッター
  attr_reader :name
  attr_accessor :hp
  attr_reader :offense
  attr_reader :defense

  # initializeメソッド 引数はhashのみの受け取り
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
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

# attackメソッドの呼び出し
brave.attack(monster)