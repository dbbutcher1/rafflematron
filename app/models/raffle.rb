class Raffle < ActiveRecord::Base
  attr_accessible :id, :name, :num_prizes, :num_entries, :raffle_owner
  has_many :prize
  has_many :entries
end
