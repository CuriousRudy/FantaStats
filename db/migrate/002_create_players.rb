class CreatePlayers < ActiveRecord::Migration[4.2]
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string :full_name
      t.integer :team_id
      t.string :position
      t.string :status
      t.integer :fantasy_id
    end
  end
end
