class Prizes < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :raffle
end
