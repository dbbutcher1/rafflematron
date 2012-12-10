class Prize < ActiveRecord::Base
  attr_accessible :prize
  belongs_to :raffle
  has_attached_file :photo,
    :styles => { :thumb => "100x100#" }
end
