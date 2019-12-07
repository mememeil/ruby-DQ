# message_dialogの読み込み
require "./message_dialog"

class GamesController
  # MessageDialogモジュールのinclude
  include MessageDialog

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
      result = calc_exp_gold

      # end_messageの呼び出し
      end_message(result)
        
    end

    def calc_exp_gold
      if brave_win?
        brave_win_flag = true
        exp = ((@monster.offense + @monster.defense) * 2).floor
        gold = ((@monster.offense + @monster.defense) * 3).floor
      else
        brave_win_flag = false
        exp = 0
        gold = 0
      end

      {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
    end

end