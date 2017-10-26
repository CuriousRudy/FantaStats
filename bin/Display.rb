
class Display

  def welcome_message
    puts "FantaStats"
    puts "----------"
    puts "Fantasy Football Tracker Tool"
  end

  def menu_tree
    puts "What would you like to do?"
    puts "1. Fantasy Team"
    puts "2. Player Menu"
    puts "3. Game Stats"
  end

  def fantasy_team_menu
    puts ""
    puts "1. Display Roster"
    puts "2. Add to Roster"
    puts "3. Drop from Roster"
    # puts "4. Add Full Team"
  end

  def player_stats_menu
    puts ""
    puts "1. Games Stats for Games Played in a Season" ## includes number of games played before displaying data for all games played
    puts "2. Points-Per-Game Average"
    puts "3. Player Stats for a Game Played"
    puts "4. Fantasy Points Earned in a Week"
    puts "5. Top 5 for a Position in a Season"
    puts "6. Player Consistency Rating"
  end

  def game_stats_menu ## Asks for a game
    puts ""
    puts "1. MVP of a Game"
    puts "2. MVP of the Week"
  end

  def show_roster(fantasy_team)
    puts ""
    puts self.display_a_fantasy_team(fantasy_team)
    Player.where(fantasy_id: fantasy_team.id).each do |player|
      self.display_a_player(player)
    end
  end

  def games_stats_for_games_played_in_a_season(player, season)
    #games played before displaying data for all games played
    puts player.full_name.to_s + " has played " + player.season_game_count(season).to_s + " game(s) out of 16 in " + season.to_s + "."
    # stats for every game
    puts "His stats for each game were: "
    player.find_season_games(season).each do |game|
      self.display_a_game_and_stat(game)
      puts ""
    end
    puts ""
  end

  def ppg_average(player, season)
    puts "The points-per-game average for " + player.full_name + "in the " + season + " season was " + player.ppg_average(season) + "."
  end

  def player_stats_for_a_game_played(player, week, season)
    puts player.full_name + " stats for " + season + ", week " + week
    if player.find_game_by_week(week, season).first.is_a? String
      puts player.find_game_by_week(week, season)
    else
      self.display_a_game_and_stat(player.find_game_by_week(week, season).first)
    end
    puts ""
  end

  def fantasy_points_earned_in_a_week(player, week, season)
    puts player.full_name + " earned " + player.fantasy_score_by_week(week, season).to_s + " points in week " + week.to_s + " of the " + season.to_s + " season."
    puts ""
  end

  def top_5_for_a_position_in_a_season(position, season)
    # byebug
    puts "The top 5 fantasy players at " + position + " in the " + season.to_s + " season are:"
    Player.top_5_by_position_for_season(position, season).each.with_index do |player, index|
      # byebug
       puts "#{index + 1}. #{player.full_name} - #{player.points_by_season(season)}"
    end
    puts ""
  end

  def mvp_of_a_game(game)
    puts "The highest scoring player of this game is: #{Player.find(game.highest_scoring_player[0]).full_name}"
  end

  def mvp_of_the_week(week, season)
    puts "The top 5 scoring players of week #{week} are:"
    Player.top_5_weekly(week, season).each.with_index do |player, index|
      puts "#{index + 1}. #{player.full_name}"
    end
    puts ""
  end

  def player_consistency_rating(player, season)
    puts player.full_name + " had a consistency rating of " + player.consistency_rating(season).round(3).to_s + " in the " + season.to_s + " season."
    puts ""
  end

  def display_a_player(player)
    puts player.team_id.to_s + " - " + player.full_name.to_s + " - Position: " + player.position.to_s
  end

  def display_a_fantasy_team(fantasy_team)
    puts fantasy_team.name + " - Owner: " + fantasy_team.owner
  end

  def display_a_game(game)
    puts game.season.to_s + " season - Week: " + game.week.to_s
  end

  def display_a_stat(stat)
    puts "Pass Yds: " + stat.pass_yds.to_s
    puts "Pass TDs: " + stat.pass_tds.to_s
    puts "Pass 2pt: " + stat.pass_twopts.to_s
    puts "Pass Int: " + stat.pass_int.to_s
    puts "Rec Yds: " + stat.rec_yds.to_s
    puts "Rec TDs: " + stat.rec_tds.to_s
    puts "Rec 2pt: " + stat.rec_twopts.to_s
    puts "Rush Yds: " + stat.rec_yds.to_s
    puts "Rush TDs: " + stat.rec_tds.to_s
    puts "Rush 2pt: " + stat.rush_twopts.to_s
    puts "Fumbles: " + stat.fumbles.to_s
  end

  def display_a_game_and_stat(game)
    self.display_a_game(game)
    self.display_a_stat(Stat.find_by(game_id: game.id))
  end

end
