class WinnersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @raffles = Raffle.where(:raffle_owner => current_user.email)
  end

  def winner
    @entries = Entry.where(:raffle_id => params[:raffle_id])
    @raffle = Raffle.find(params[:raffle_id])
    grand_winner = 1 + rand(@entries.count)
    @winner = @entries[grand_winner]
    if @winner != nil
      @raffle.has_winner = true
      @raffle.winner = @winner.email
      @raffle.save
    else
      flash[:notice] = "No suitible entries found"
      redirect_to winners_path
     end
  end
  
  def destroy
    Raffle.find(params[:id]).destroy
  end
end
