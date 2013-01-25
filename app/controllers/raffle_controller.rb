class RaffleController < ApplicationController
  @@raffle_id = 1
  def index
  end

  def view
    @raffle = Raffle.find(params[:raffle_id])
  end

  def update
    @raffle = Raffle.find(params[:id])
    @raffle.update_attributes(params[:raffle])
    flash[:notice] = "Save successful"
    redirect_to winners_path
  end

  def edit
    @raffle = Raffle.find(params[:id])
  end

  def name
    @raffle = Raffle.new
  end   

  def type
    @raffle = Raffle.create!(params[:raffle])
    @@raffle_id = @raffle.id
    @raffle.has_winner = false
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

  def destroy
    Raffle.find(params[:id]).destroy
    flash[:notice] = "Deleted successfully"
    redirect_to winners_path
  end
end
