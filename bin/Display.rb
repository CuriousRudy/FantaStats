class Display

  def welcome_message
    puts "FantaStats"
    puts "----------"
    puts "Fantasy Football Tracker Tool"
  end

  def menu_tree
    puts ""
    puts "1. Fantasy Team"
    puts "2. Player Menu"
    puts "2. Game Stats"
  end

  def fantasy_team_menu
    puts ""
    puts "    1. Display Roster"
    puts "    2. Add Full Team"
    puts "    3. Add to Roster"
    puts "    4. Drop from Roster"
  end

  def player_stats_menu
    puts ""
    puts "    1. Games Stats for Games Played in a Season" ## includes number of games played before displaying data for all games played
    puts "    2. Points-Per-Game Average"
    puts "    3. Player Stats for a Game Played"
    puts "    4. Fantasy Points Earned in a Week"
    puts "    5. Top 5 for a Position in a Season"
    puts "    6. Player Consistency Rating"
  end

  def game_stats_menu ## Asks for a game
    puts ""
    puts "    1. MVP of a Game"
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
      self.display_a_game(game)
      self.display_a_stat(Stat.find_by(game_id: game.id))
      puts ""
    end
    puts ""
  end


  def display_a_player(player)
    puts player.team_id.to_s + " - " + player.full_name.to_s + " - Position: " + player.position.to_s
  end

  def display_a_fantasy_team(fantasy_team)
    puts fantasy_team.name.to_s + " - Owner: " + fantasy_team.owner.to_s
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

  # puts     2. Points-Per-Game Average
  # puts "    3. Player Stats for a Game Played"
  # puts "    4. Fantasy Points Earned in a Week"
  # puts "    5. Top 5 for a Position in a Season"
  # puts "    6. Player Consistency Rating"

  # player = Player.find_by(full_name: "Andrew Luck")
  # display = Display.new
  # display.games_stats_for_games_played_in_a_season(player, 2016)


end
