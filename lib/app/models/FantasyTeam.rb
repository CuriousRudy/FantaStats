# Fantasy Team model

#roster = ["Marcus Mariota", "LeSean McCoy",	"Mark Ingram", "Larry Fitzgerald", "Jarvis Landry", "Zach Miller", "Chris Ivory", "Greg Zuerlein", "Jordan Howard", "Leonard Fournette", "Andrew Luck", "Matt Forte", "Rishard Matthews", "Latavius Murray", "Jacoby Brissett"]

class FantasyTeam < ActiveRecord::Base

  has_many :players

  def update_team_with_roster(roster) #works
    roster.each do |fantasy_player|
      #Player.find_by(full_name: fantasy_player).fantasy_id = self.id
      current_player = Player.find_by(full_name: fantasy_player)
      current_player.fantasy_id = self.id
      current_player.save
    end
  end

  def my_roster #find players where fantasy_id = self.id #works
    Player.where(fantasy_id: self.id)
  end

  def add_to_roster(full_name) #updates an instance of a player with new fantasy_id and saves to DB   #works
    player = Player.where(:full_name => full_name)
      player.update(fantasy_id: self.id)
    end

  def drop_from_roster(full_name) #updates an instance of player with fantasy_id = nil and saves to DB   #works
    player = self.my_roster.where(:full_name => full_name)
    player.update(fantasy_id: nil)
  end



 #team.my_roster.first.points_by_season(arg)



end
