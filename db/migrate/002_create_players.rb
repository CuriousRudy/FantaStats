class CreatePlayers < ActiveRecord::Migration[4.2]
  def change
    create_table :players, id:false do |t|
      t.integer :id, primary_key: true
      t.string :full_name
      t.string :team_id
      t.string :position
      t.string :status
      t.integer :fantasy_id
    end
  end
end
