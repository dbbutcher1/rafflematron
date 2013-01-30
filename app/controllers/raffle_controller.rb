class RaffleController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def view
    @raffle = Raffle.find(params[:raffle_id])
  end

  def update
    @raffle = Raffle.find(params[:id])
    @raffle.update_attributes(params[:raffle])
    @raffle.editing = false
    @prizes = Prize.where(:raffle_id => @raffle.id)
    params[:prize].each do |key, value|
      puts value
      if value["_destory"] == "1"
        Prize.find(@prizes[key.to_i].id).destroy
        @raffle.num_prizes = @raffle.num_prizes - 1
        @raffle.save
      else
        @prizes[key.to_i].raffle_id = @raffle.id
        @prizes[key.to_i].prize_name = value["prize_name"]
        @prizes[key.to_i].photo = value["photo"]
        @prizes[key.to_i].save
      end
    end
    flash[:notice] = "Edit complete"
    redirect_to winners_path
  end

  def edit
    @raffle = Raffle.find(params[:id])
    @raffle.editing = true
    @prizes = Prize.where(:raffle_id => params[:id])
  end

  def name
    @raffle = Raffle.new
  end   

  def type
    @raffle = Raffle.create!(params[:raffle])
    @raffle.editing = false
    @raffle.has_winner = false
    @raffle.num_prizes = 1
    @raffle.raffle_owner = current_user.email
    @raffle.save
  end

  def prize
    @raffle = Raffle.find(params[:raffle][:id])
    @raffle.update_attributes(params[:raffle])
    @prizes = []
    @raffle.num_prizes.times { @prizes << Prize.new }
  end 
  
  def completed
    @raffle = Raffle.find(params[:raffle][:id])
    @prizes = []
    @raffle.num_prizes.times { @prizes << Prize.new }
    params[:prize].each do |key, value|
      puts value
      @prizes[key.to_i].raffle_id = @raffle.id
      @prizes[key.to_i].prize_name = value["prize_name"]
      @prizes[key.to_i].photo = value["photo"]
      @prizes[key.to_i].save
    end
  end

  def destroy
    Raffle.find(params[:id]).destroy
    flash[:notice] = "Deleted successfully"
    redirect_to winners_path
  end
end
