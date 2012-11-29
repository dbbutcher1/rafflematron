class RaffleController < ApplicationController
  def index
  end

  def name
    @raffle = Raffle.new
  end

  def type
    @raffle = Raffle.create!(params[:raffle])
  end
end
