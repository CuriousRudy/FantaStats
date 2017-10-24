class Stat < ActiveRecord::Base
  include FantasyScoring
  
  belongs_to :player
  belongs_to :game
end
