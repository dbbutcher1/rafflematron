class Entry < ActiveRecord::Base
  attr_accessible :name, :email, :raffle_id, :id
  belongs_to :raffle
end
