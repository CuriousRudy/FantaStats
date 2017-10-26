require_relative '../config/environment.rb'
def run
  "welcome" #welcome_message
  puts "What would you like to do:"
  main_menu
  input = gets.chomp
end

def main_menu
  "options here"#menu_tree
  input = gets.chomp
  case input
  when "1"
      fantasy_menu
    when "2"
      stats_menu
    when "3"
    top_scoring_menu
    end
  end

  def fantasy_menu
    my_team = make_fantasy_team
    fantasy_team_menu
    puts "What would you like to do:"
    input = gets.chomp
    case input
    when "1"
      my_team.my_roster
    when "2"
      roster = build_roster
      my_team.update_team_with_roster(roster)
    when "3"
      my_team.add_to_roster(get_player)
    when "4"
      my_team.drop_from_roster(get_player)
    end
  end

  def stats_menu
    player = Player.find_by(full_name: get_player)
    player_stats_menu
    puts "What would you like to do"
    input = gets.chomp
    case input
    when "1"
        player.points_by_season(get_season)
      when "2"
        player.ppg_average(get_season)
      when "3"
        player.player_stat_by_week(get_week, get_season)
      when "4"
          player.fantasy_score_by_week(get_week, get_season)
      when "5"
        puts "Select a position:"
        input = gets.chomp
        Player.top_5_by_position_for_season(input, get_season)
      when "6"
        player.consistency_rating(get_season)
      end
    end

    def top_scoring_menu
      puts "What information would you like?"
      game_menu
      input = gets.chomp
      case input
      when "1"
        game = get_game
        Player.find(game.highest_scoring_player[0])
      when "2"
        Game.mvp_of_the_week(get_week, get_season)
      when "3"
        Game.top_5_weekly(get_week, get_season)
      end
    end



#helper methods for ths CLI

    def get_game
      game = Game.where(get_week, get_season).each_with_index do |game, i|
        puts game
      end
      puts "Which game would you like to look at?"
      input gets.chomp
      game = game[input]
    end

    def make_fantasy_team
      puts "What is your name?"
      owner = gets.chomp
      puts "What is your team name?"
      name = gets.chomp
      your_team = FantasyTeam.create(name: name, owner: owner)
      your_team
    end

    def build_roster
      roster = []
      puts "Please add a player:"
      input = gets.chomp
      until input == "done"
        roster << input
        input = gets.chomp
      end
      roster
    end


    def get_season
      puts "Please enter a season (2009 - 2016):"
      input = gets.chomp
      input
    end

    def get_week
      puts "Please select a week (1 - 16):"
      input = gets.chomp
      input
    end

    def get_player
      puts "Please select a player by full name:"
      input = gets.chomp
      input
    end
