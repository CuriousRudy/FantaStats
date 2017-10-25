# Player model

class Player < ActiveRecord::Base
  has_many :stats
  has_many :games, through: :stats
  belongs_to :fantasy_team
  belongs_to :team


  def find_season_games(season)
    if self.games.where(season: season).empty?
      "#{self.full_name} was not active during the #{season} season!"
    else
      self.games.where(season: season)
    end
  end

  def season_game_count(season)
    self.find_season_games(season).count
  end

  def ppg_average(season)
    self.points_by_season(season) / self.season_game_count(season)
  end

  def find_by_week(week, season)
    if self.games.where(week: week, season: season).empty?
      "#{self.full_name} did not play week #{week}!"
    else
      self.games.where(week: week, season: season)
    end
  end

  def player_stat_by_week(week, season)
    game = self.find_by_week(week, season)
    players_stats = Stat.find_by(game_id: 1540, player_id: 4123)
    players_stats
  end



  def points_by_season(season) #works
    total = 0
    self.games.where(season: season).each do |game|
      stats = Stat.where(game_id: game.game_id, player_id: self.id).first
        total += stats.score
        #binding.pry
    end
    total#{}"#{self.full_name} scored #{total} points during the #{season} season."
  end
  #player.points_by_season(2015)

  def self.find_by_position_and_season(position, season)
    all_players_of_position_w_points = Player.where(position: position).map do |player|
    [player.id, player.points_by_season(season)] if player.points_by_season(season)
    end
    top_5 = sort_nested_array(all_players_of_position_w_points).first(5)#.map {|array| "#{Player.find(array[0]).full_name} scored #{Player.find(array[0]).points_by_season(season)} points in #{season}" }
    top_5.map {|array| Player.find(array[0])}
  end

  private

  def self.sort_nested_array(array)
    array.sort {|a, b| b[1] <=> a[1]}
  end

end
