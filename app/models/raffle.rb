class Raffle < ActiveRecord::Base
  attr_accessible :id, :name, :prizes
end
