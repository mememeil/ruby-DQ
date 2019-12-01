class GamesController
  def battle(**params)
    build_characters(params)
    
    loop do
        @brave.attack(@monster)
        break if battle_end?
        puts "------------------------------------"
        @monster.attack(@brave)
        break if battle_end?
        puts "------------------------------------"
    end

    battle_judgement
  end

  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      @brave.hp <= 0 || @monster.hp <= 0
    end

    def brave_win?
      @brave.hp > 0
    end

    def battle_judgement
      if brave_win?
        result = calc_exp_gold
        puts "#{@brave.name}は戦いに勝った！"
        puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを手に入れた！"
      else
        puts "#{@brave.name}は戦いに負けた…"
        puts "目の前が真っ暗になった"
      end
    end

    def calc_exp_gold
      exp = ((@monster.offense + @monster.defense) * 2).floor
      gold = ((@monster.offense + @monster.defense) * 3).floor
      result = {exp: exp, gold: gold}

      result
    end

end