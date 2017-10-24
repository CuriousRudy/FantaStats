# Fantasy Team model

#roster = ["Marcus Mariota", "LeSean McCoy",	"Mark Ingram", "Larry Fitzgerald", "Jarvis Landry", "Zach Miller", "Chris Ivory", "Greg Zuerlein", "Jordan Howard", "Leonard Fournette", "Andrew Luck", "Matt Forte", "Rishard Matthews", "Latavius Murray", "Jacoby Brissett"]

class FantasyTeam < ActiveRecord::Base

  has_many :players

  def update_team_with_roster(roster)
    roster.each do |fantasy_player|
      #Player.find_by(full_name: fantasy_player).fantasy_id = self.id
      current_player = Player.find_by(full_name: fantasy_player)
      current_player.fantasy_id = self.id
      current_player.save
    end
  end

end
