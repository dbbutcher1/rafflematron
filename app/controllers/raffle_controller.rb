class RaffleController < ApplicationController
  @@raffle_id = 1
  def index
  end

  def name
    @raffle = Raffle.new
  end   

  def type
    @raffle = Raffle.create!(params[:raffle])
    @@raffle_id = @raffle.id
    @raffle.num_prizes = 1
    @raffle.raffle_owner = current_user.email
    @raffle.save
  end

  def prize
    @raffle = Raffle.find(@@raffle_id)
    @raffle.assign_attributes(params[:raffle], params[:raffle])
    @raffle.save 
  end 
  
  def completed
    @raffle = Raffle.find(@@raffle_id)
    @prizes = Prize.new
    @prizes.prize = params[:prize]
    @prizes.photo = params[:photo]
    @prizes.save
    @entry = Entry.create!(:raffle_id => @@raffle_id)
  end
end
