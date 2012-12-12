class Entries < ActiveRecord::Base
  attr_accessible :name, :email, :raffle_id
  belongs_to :raffle
end
