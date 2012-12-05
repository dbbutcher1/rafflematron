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
    @raffle.prizes = 1
    @raffle.save
  end

  def prize
    @raffle = Raffle.find(@@raffle_id)
    @raffle.assign_attributes(params[:raffle])
    @prize = @raffle.prizes.to_i
  end 
end