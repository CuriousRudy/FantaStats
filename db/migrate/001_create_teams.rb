class CreateTeams < ActiveRecord::Migration[4.2]
  def change
    create_table :teams do |t|
      t.string :abbrev
      t.string :city
      t.string :name
      t.boolean :active?
    end
  end

end
