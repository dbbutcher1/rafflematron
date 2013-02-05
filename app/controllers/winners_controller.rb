class WinnersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @raffles = Raffle.where(:raffle_owner => current_user.email)
  end

  def winner
    @entries = Entry.where(:raffle_id => params[:raffle_id])
    @raffle = Raffle.find(params[:raffle_id])
    @winners = []
    index = 0
    @raffle.num_prizes.times do
      begin
        winner = 1 + rand(@entries.count)
      end until @winners.include?(@entries[winner]) == false && @entries[winner] != nil
      @winners[index] =  @entries[winner]
      index += 1
    end
    
    if @winners[0] != nil
      @raffle.has_winner = true
      @raffle.winner = @winners[0].email
      @raffle.save
    else
      flash[:notice] = "No suitible entries found"
      redirect_to winners_path
     end
  end
  
  def destroy
    Raffle.find(params[:id]).destroy
  end

  def check_winners(winners, new_winner)
    if winners.include? new_winner
      
    else
    end
  end
  
  def new_winner
  end
end
