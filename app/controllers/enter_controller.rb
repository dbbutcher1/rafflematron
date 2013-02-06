class EnterController < ApplicationController
  def enter
    begin
      @raffle = Raffle.where(:uri => params[:uri])
      if @raffle[0].has_winner == true
        flash[:error] = "Raffle has ended"
        redirect_to :root
      else
        @enter = Entry.new
        @enter.raffle_id = @raffle[0].id
        @enter.save
      end
    rescue Exception => e
      puts e
      flash[:error] = "Not Found"
      redirect_to :root
    end
  end

  def update
    @entry = Entry.find(params[:entry][:id])
    puts @entry.id
    @raffle = Raffle.find(@entry.raffle_id)
    @entries = Entry.where(:raffle_id => @entry.raffle_id)
    isEntered = 0
    puts params[:entry][:email]
    @entries.each do |e|
      if e.email == params[:entry][:email]
        isEntered = isEntered + 1
      end
    end
    
    if isEntered > @raffle.num_entries && @raffle.num_entries != 0
      flash[:notice] = "Email already entered"
      redirect_to root_path
    else
      @entry.update_attributes(params[:entry])
      flash[:notice] = "Entered Successfully"
      redirect_to root_path
    end
  end
end
