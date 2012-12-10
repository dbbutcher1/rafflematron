class Raffle < ActiveRecord::Base
  attr_accessible :id, :name, :num_prizes, :entries
  has_many :prize
end
