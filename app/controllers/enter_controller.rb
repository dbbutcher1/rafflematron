class EnterController < ApplicationController
  def show
    @enter = Entry.where(:raffle_id => params[:id]).paginate(:page => params[:page], :per_page => 25)
    render :layout => "application"
  end  

  def enter
    sign_out current_user
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
    render :layout => "enter"
  end

  def update
    @enter = Entry.find(params[:entry][:id])
    @raffle = Raffle.find(@enter.raffle_id)
    @entries = Entry.where(:raffle_id => @enter.raffle_id)
    isEntered = 0
    @entries.each do |e|
      if e.email == params[:entry][:email]
        isEntered = isEntered + 1
      end
    end
    
    if isEntered > @raffle.num_entries && @raffle.num_entries != 0
      flash[:notice] = "Email already entered"
      redirect_to enter_raffle_path(:uri => @raffle.uri)
    else
      @enter.update_attributes(params[:entry])
      EntryMailer.registration_confirmation(@enter, @raffle, request).deliver
      flash[:notice] = "Entered Successfully"
      redirect_to enter_raffle_path(:uri => @raffle.uri)
    end
  end
end
