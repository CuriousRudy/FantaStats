 #!/usr/bin/env ruby
require 'pry'
require_relative '../config/environment.rb'

def run
  display = Display.new
  display.welcome_message
  main_menu
end

def main_menu
  display = Display.new
  display.menu_tree
  input = gets.chomp
  case input
    when "1"
      fantasy_menu
    when "2"
      stats_menu
    when "3"
    top_scoring_menu
  when "exit"
    main_menu
  else
    main_menu
    end
  end

  def fantasy_menu
    display = Display.new
    $my_team ||= make_fantasy_team
    display.fantasy_team_menu
    puts "What would you like to do:"
    input = gets.chomp
    case input
    when "1"
      display.show_roster($my_team)
    # when "2"
    #   roster = build_roster
    #   $my_team.update_team_with_roster(roster)
    #   display.show_roster($my_team)
  when "2"
      $my_team.add_to_roster(get_player)
      display.show_roster($my_team)
    when "3"
      $my_team.drop_from_roster(get_player)
      display.show_roster($my_team)
    when "exit"
      main_menu
      return
    end
    fantasy_menu
  end

  def stats_menu
    display = Display.new
    player = Player.find_by(full_name: get_player)
    display.player_stats_menu
    puts "What would you like to do"
    input = gets.chomp
    case input
      when "1"
          display.games_stats_for_games_played_in_a_season(player, get_season)
      when "2"
          display.ppg_average(get_season)
      when "3"
          display.player_stats_for_a_game_played(player, get_week, get_season)
      when "4"
          display.fantasy_points_earned_in_a_week(player, get_week, get_season)
      when "5"
        # byebug
           display.top_5_for_a_position_in_a_season(get_position, get_season)
      when "6"
          display.player_consistency_rating(player, get_season)
      when "exit"
        main_menu
      end
    end

    def top_scoring_menu
      display = Display.new
      puts "What information would you like?"
      display.game_stats_menu
      input = gets.chomp
      case input
      when "1"
          display.mvp_of_a_game(get_game)
      when "2"
          display.mvp_of_the_week(get_week, get_season)
      end
    end



#helper methods for ths CLI

    def get_game
      game = Game.find_by(week:3,season:2013)
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

    def get_position
      puts "Please enter a position:"
      input = gets.chomp
      input
    end


run
