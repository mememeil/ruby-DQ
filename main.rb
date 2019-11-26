class Brave
  # nameのセッター
  def name=(name)
    @name = name
  end

  # hpのセッター
  def hp=(hp)
    @hp = hp
  end

  # offenseのセッター
  def offense=(offense)
    @offense = offense
  end

  # defenseのセッター
  def defense=(defense)
    @defense = defense
  end

end

brave = Brave.new

brave.name = "テリー"
brave.hp = 500
brave.offense = 150
brave.defense = 100