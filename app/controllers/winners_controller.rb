class WinnersController < ApplicationController
  def index
    @raffles = Raffle.all
  end

  def winner
    @entries = Entry.where(:raffle_id => params[:raffle_id])
    grand_winner = 1 + rand(@entries.count)
    puts @entries[grand_winner].name
  end
end
