class Game < ActiveRecord::Base
  has_many :stats
  has_many :players, through: :stats


  def highest_scoring_player
    scores = Stat.where(game_id: self.id).map do |stat|
      [stat.player_id, stat.score] if stat.score
    end
    mvp = sort_nested_array(scores).first #top_2 = sort_nested_array(scores).first(2) / #{top_2[0]} is the mvp and #top{2} is a close second
  end #Player.find(mvp[0])this #{player} is the MVP of the game

  private

  def sort_nested_array(nested_array)
    nested_array.sort { |a, b| b[1] <=> a[1] }
  end

end
