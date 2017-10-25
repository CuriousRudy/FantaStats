# Player model

class Player < ActiveRecord::Base

  has_many :stats
  has_many :games, through: :stats
  belongs_to :fantasy_team
  belongs_to :team


  def find_season_games(season)
    self.games.where(season: season)
  end

  # total points accumulated over a season by a player, given the year
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
    all_players_of_position_w_points.sort_nested_array
  end

  def consistency_rating(season)
    array_of_weekly_scores = []
    self.find_season_games(season).each do |game|
      array_of_weekly_scores << game.stats.find_by(player_id: self.id).score
    end
    binding.pry
    standard_deviation(array_of_weekly_scores) / ppg_average(season)
  end


  private

  def sort_nested_array(nested_array)
    nested_array.sort { |a, b| b[1] <=> a[1] }
  end

  def sum(array)
    array.inject(0){|accum, i| accum + i }
  end

  def mean(array)
    sum(array)/array.length.to_f
  end

  def sample_variance(array)
    sum = array.inject(0){ |accum, i| accum + (i - mean(array)) ** 2 }
    sum/(array.length - 1).to_f
  end

  def standard_deviation(array)
    Math.sqrt(sample_variance(array))
  end

end
