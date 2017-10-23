class CreateFantasyTeam < ActiveRecord::Migration
  def change
    create_table :fantasy_team do |t|
      t.string :name
      t.string :owner
    end
  end

end
