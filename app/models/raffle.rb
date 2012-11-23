class Raffle < ActiveRecord::Base
  attr_accessible :Name, :Prize, :Start, :end
end
