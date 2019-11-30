# Characterクラスの定義
class Character
  attr_accessor :name, :hp
  attr_reader :offense, :defense, :full_hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end