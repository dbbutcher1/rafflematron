class EntriesController < ApplicationController

  def index
    @raffles = Raffle.all
  end

  def enter
    @entry = Entry.new
    @entry.raffle_id = params[:raffle_id]
    @entry.save
  end
  
  def confirm
    @entry = Entry.find(params[:id])
    @raffle = Raffle.find(@entry.raffle_id)
    
    @entry.assign_attributes(:name => params[:name], :email => params[:email])
    @entry.save
  end

  def update
    @entry = Entry.find(params[:entry][:id])
    @entries = Entry.where(:raffle_id => @entry.raffle_id)
    @raffle = Raffle.find(@entry.raffle_id)
    isEntered = 0
    puts params[:entry][:email]
    @entries.each do |e|
      if e.email == params[:entry][:email]
        isEntered = isEntered + 1
      end
    end
    
    if isEntered > @raffle.num_entries
      flash[:notice] = "Email already entered"
      redirect_to root_path
    else
      @entry.update_attributes(params[:entry])
    end
  end
end
