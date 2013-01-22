class WinnersController < ApplicationController
  def index
    @raffles = Raffle.where(:raffle_owner => current_user.email)
  end

  def winner
    @entries = Entry.where(:raffle_id => params[:raffle_id])
    grand_winner = 1 + rand(@entries.count)
    @winner = @entries[grand_winner]
  end
end
