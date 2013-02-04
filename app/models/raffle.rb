class Raffle < ActiveRecord::Base
  attr_accessible :id, :name, :num_prizes, :num_entries, :raffle_owner, :uri
  validates_uniqueness_of :uri, :case_sensitive => false
  has_many :prize
  has_many :entries
  accepts_nested_attributes_for :prize, :allow_destroy => true
end
