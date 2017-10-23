# Player model

class Player < ActiveRecord::Base
  belongs_to :fantasy_team
  belongs_to :team
end
