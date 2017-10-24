class CreateStats < ActiveRecord::Migration[4.2]
  def change
    create_table :stats do |t|
      t.integer :fumbles
      t.integer :pass_tds
      t.integer :pass_twopts
      t.integer :pass_yds
      t.integer :pass_int
      t.integer :rec_yds
      t.integer :rec_tds
      t.integer :rec_twopts
      t.integer :rush_yds
      t.integer :rush_tds
      t.integer :rush_twopts
      t.integer :game_id
      t.integer :player_id
    end
  end

end
