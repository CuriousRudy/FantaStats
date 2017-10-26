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

  def find_game_by_week(week, season) #finds a players game on a given week
    if self.games.where(week: week, season: season).empty?
      "#{self.full_name} did not play week #{week}!"
    else
      self.games.where(week: week, season: season)
    end
  end

  def player_stat_by_week(week, season) #shows stat for a given week using game output from find_game_by_week
    game = self.find_game_by_week(week, season).first
    players_stats = Stat.where(game_id: game.id, player_id: self.id).first
    players_stats
  end

  def fantasy_score_by_week(week, season) #scores the stat from above methods
    stats = self.player_stat_by_week(week, season)
    stats.score
  end


  def points_by_season(season) #shows a players score by season
    total = 0
    self.games.where(season: season).each do |game|
      stats = Stat.where(game_id: game.game_id, player_id: self.id).first
        total += stats.score
        #binding.pry
    end
    total #{}"#{self.full_name} scored #{total} points during the #{season} season."
  end


  def self.top_5_by_position_for_season(position, season)  #top 5 players in a season by position
    all_players_of_position_w_points = Player.where(position: position).map do |player|
    [player.id, player.points_by_season(season)] if player.points_by_season(season)
    end
    top_5 = sort_nested_array(all_players_of_position_w_points).first(5)#.map {|array| "#{Player.find(array[0]).full_name} scored #{Player.find(array[0]).points_by_season(season)} points in #{season}" }
    top_5.map {|array| Player.find(array[0])}
  end

  def consistency_rating(season)
    array_of_weekly_scores = []
    self.find_season_games(season).each do |game|
      array_of_weekly_scores << game.stats.find_by(player_id: self.id).score
    end
    #binding.pry
    standard_deviation(array_of_weekly_scores) / ppg_average(season)
  end


  def self.mvp_of_the_week(week, season)
    this_week = Game.where(week: week, season: season).map do |game|
      game.highest_scoring_player
    end
    mvp = sort_nested_array(this_week).first #use first(5) for top 5 players of a week
      Player.find(mvp[0]) #is the player that is the mvp.
  end
  # Player.find(Game.mvp_of_the_week(3,2014)[0])

  def self.top_5_weekly(week, season)
    this_week = Game.where(week: week, season: season).map do |game|
      game.highest_scoring_player
    end
    mvp = sort_nested_array(this_week).first(5).map {|array| Player.find(array[0])}
  end


  private

  def self.sort_nested_array(nested_array)
    nested_array.sort { |a, b| b[1] <=> a[1] }
  end

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
