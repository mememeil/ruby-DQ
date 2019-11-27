class Brave
  # attr_readerでゲッターの置換
  attr_reader :name
  # attr_reader :hp
  attr_reader :offense
  attr_reader :defense

  # attr_writer :hp

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

  # nameのセッター
  # def name=(name)
  #   @name = name
  # end

  # nameのゲッター
  # def name
  #   @name
  # end

  # hpのセッター復活
  # def hp=(hp)
  #   @hp = hp
  # end

  # hpのゲッター
  # def hp
  #   @hp
  # end

  # offenseのセッター
  # def offense=(offense)
  #   @offense = offense
  # end

  # offenseのゲッター
  # def offense
  #   @offense
  # end

  # defenseのセッター
  # def defense=(defense)
  #   @defense = defense
  # end

  # defenseのゲッター
  # def defense
  #   @defense
  # end

end

#キーワード引数（hash）でinitializeメソッドに値を渡す
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

# brave.name = "テリー"
# brave.hp = 500
# brave.offense = 150
# brave.defense = 100

# 値を取得する
# puts "NAME:#{brave.name}" 
# puts "HP:#{brave.hp}"
# puts "OFFENSE:#{brave.offense}"
# puts "DEFENSE:#{brave.defense}"

# ヒアドキュメント
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT

# ダメージでHPが減る処理
brave.hp -= 30