class CreateFantasyTeam < ActiveRecord::Migration[4.2]
  def change
    create_table :fantasy_teams do |t|
      t.string :name
      t.string :owner
    end
  end

end
