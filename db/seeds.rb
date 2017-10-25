require 'pry'
require 'csv'

players = File.read("./db/seeds/players.csv")
players = CSV.parse(players)
columns = players.shift

players.each do |row|
  Player.create(:id => row[0], columns[1].to_sym => row[1], columns[2].to_sym => row[2], columns[3].to_sym => row[3], columns[4].to_sym => row[4])
end

teams = File.read("./db/seeds/team_table.csv")
teams = CSV.parse(teams)
#binding.pry
team_col = teams.shift

teams.each do |row|
  Team.create(:team_id => row[0], team_col[1].to_sym => row[1], team_col[2].to_sym => row[2], team_col[3].to_sym => row[3] == "True")
end

games = File.read("./db/seeds/games.csv")
games = CSV.parse(games)
games.shift

games.each do |row|
  Game.create(:game_id => row[0].to_i, :season => row[4].to_i)
end

stats = File.read("./db/seeds/stats.csv")
stats = CSV.parse(stats)
stats.shift

stats.each do |row|
  Stat.create(:fumbles => row[0], :pass_tds => row[1], :pass_twopts => row[2], :pass_yds => row[3], :pass_int => row[4], :rec_yds => row[5],  :rec_tds => row[6],
     :rec_twopts => row[7], :rush_yds => row[8], :rush_tds => row[9], :rush_twopts => row[10], :game_id => row[11], :player_id => row[12])
end
