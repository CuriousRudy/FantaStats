require 'pry'
require 'csv'

players = File.read("./db/seeds/players.csv")
players = CSV.parse(players)
columns = players.shift

players.each do |row|
  #binding.pry
  Player.create(columns[0].to_sym => row[0], columns[1].to_sym => row[1], columns[2].to_sym => row[2], columns[3].to_sym => row[3], columns[4].to_sym => row[4])
end

teams = File.read("./db/seeds/team_table.csv")
teams = CSV.parse(teams)
team_col = teams.shift

teams.each do |row|
  Team.create(team_col[0].to_sym => row[0], team_col[1].to_sym => row[1], team_col[2].to_sym => row[2], team_col[3].to_sym => row[3])
end
