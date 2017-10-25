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
      stats = Stat.where(game_id: game.game_id, player_id: self.id).first
        total += stats.score
        #binding.pry
    end
    total
  end

  def self.find_by_position_and_year(position, year)
    all_players_of_position_w_points = []
    Player.where(position: position).each do |player|
      all_players_of_position_w_points << [player, player.points_by_season(year)] #unless player.points_by_season(year) == 0
    end
    all_players_of_position_w_points
  end
end
