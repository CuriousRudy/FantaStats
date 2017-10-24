# Player model

class Player < ActiveRecord::Base
  has_many :stats
  has_many :games, through: :stats
  belongs_to :fantasy_team
  belongs_to :team
end
