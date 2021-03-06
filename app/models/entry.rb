class Entry < ActiveRecord::Base
  before_create :generate_token
  attr_accessible :name, :email, :raffle_id, :token, :confirmed, :prize, :winner
  belongs_to :raffle

  protected
  
  def generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while Entry.where(:token => token).exists?
    self.token = token
  end
end
