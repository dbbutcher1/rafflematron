class Raffle < ActiveRecord::Base
  attr_accessible :id, :name, :num_prizes, :num_entries, :raffle_owner, :uri
  has_many :prize
  has_many :entries
  accepts_nested_attributes_for :prize, :allow_destroy => true
end
