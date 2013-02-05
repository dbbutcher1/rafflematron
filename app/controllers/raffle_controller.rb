class RaffleController < ApplicationController
  before_filter :authenticate_user!
  helper RafflesHelper

  def index
  end

  def view
    @raffle = Raffle.find(params[:raffle_id])
    @prizes = Prize.where(:raffle_id => @raffle.id)
  end

  def update
    @raffle = Raffle.find(params[:id])
    @raffle.num_entries = params[:raffle][:num_entries]
    @raffle.editing = false
    @prizes = Prize.where(:raffle_id => @raffle.id)
    params[:raffle][:prize_attributes].each do |key, value|
      puts value
      if value[:_destroy] == "1"
        Prize.find(@prizes[key.to_i].id).destroy
        @raffle.save
      elsif @prizes[key.to_i].nil?
        prize = Prize.new
        prize.raffle_id = @raffle.id
        prize.prize_name = value["prize_name"]
        prize.photo = value["photo"]
        prize.save
        @raffle.num_prizes += 1
        @raffle.save
      else
        @prizes[key.to_i].raffle_id = @raffle.id
        if value["photo"].nil?
        else
          @prizes[key.to_i].photo = value["photo"]
        end
        @prizes[key.to_i].prize_name = value["prize_name"]
        @prizes[key.to_i].save
      end
    end
    @raffle.save
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
    begin
      uri = params[:raffle][:uri]
      if params[:raffle][:uri].gsub(/[^0-9a-zA-Z]/, "-") != uri
        uri = uri.gsub(/[^0-9a-zA-Z]/, "-")
      else
        uri = params[:raffle][:uri]
      end
      @raffle = Raffle.create!(params[:raffle])
      @raffle.editing = false
      @raffle.has_winner = false
      @raffle.num_prizes = 1
      @raffle.raffle_owner = current_user.email
      @raffle.uri = uri
      @raffle.save
    rescue Exception => e
      flash[:error] = "URL Taken"
      redirect_to raffle_name_path
      puts e
    end
  end

  def prize
    @raffle = Raffle.find(params[:raffle][:id])
    @raffle.update_attributes(params[:raffle])
    @raffle.num_prizes.times do
      prize = @raffle.prize.build 
    end
  end 
  
  def completed
    @raffle = Raffle.find(params[:raffle][:id])
    @prizes = []
    @raffle.num_prizes.times { @prizes << Prize.new }
    params[:raffle][:prize_attributes].each do |key, value|
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
