# Player model

class Player < ActiveRecord::Base
  has_many :stats
  has_many :games, through: :stats
  belongs_to :fantasy_team
  belongs_to :team


  def find_season_games(season)
    self.games.where(season: season)
  end

  def points_by_season(season) #works
    total = 0
    find_season_games(season).each do |game|
      #binding.pry
      stats = Stat.where(game_id: game.game_id, player_id: self.id).first
        total += stats.score
    end
    total
  end
end
