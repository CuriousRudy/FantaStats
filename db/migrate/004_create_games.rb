class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table :games do |t|
      t.integer :game_id
      t.integer :season
    end
  end




end
