# Fantasy Team model

#roster = ["Marcus Mariota", "LeSean McCoy",	"Mark Ingram", "Larry Fitzgerald", "Jarvis Landry", "Zach Miller", "Chris Ivory", "Greg Zuerlein", "Jordan Howard", "Leonard Fournette", "Andrew Luck", "Matt Forte", "Rishard Matthews", "Latavius Murray", "Jacoby Brissett"]

class FantasyTeam < ActiveRecord::Base
  has_many :players

def update_team_with_roster(roster)
  roster.each do |fantasy_player|
    fantasy_player.fantasy_id = self.id
  end
end

end
