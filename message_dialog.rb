module MessageDialog
  # 攻撃時のメッセージ
  def attack_message(**params)
    attack_type = params[:attack_type]

    puts "#{@name}の攻撃"
    if attack_type == "sp_attack"
      puts "会心の一撃！"
    end
  end

  # ダメージを受けた時のメッセージ
  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<-EOS

#{target.name}に#{damage}のダメージをあたえた！
#{target.name}のHPは#{target.hp}になった

    EOS

  end

  # バトルが終了した時のメッセージ
  def end_message(result)
    if result[:brave_win_flag]
      puts <<-EOS

勇者は戦いに勝った！
#{result[:exp]}の経験値と#{result[:gold]}ゴールドを手に入れた！

      EOS
    else
      puts <<-EOS

勇者は戦いに負けた…
目の前が真っ暗になった

      EOS
    end
  end

  # モンスターがクラスチェンジした時のメッセージ
  def change_class_message(**params)
    origin_name = params[:origin_name]
    change_class_name = params[:change_class_name]

    puts <<-EOS

#{origin_name}は怒っている
#{origin_name}は #{change_class_name} に変身した！

    EOS
  end
end