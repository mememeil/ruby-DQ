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
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT

# ヒアドキュメント:モンスター
puts <<~TEXT
NAME:#{monster.name}
HP:#{monster.hp}
OFFENSE:#{monster.offense}
DEFENSE:#{monster.defense}
TEXT

# ダメージでHPが減る処理
brave.hp -= 30