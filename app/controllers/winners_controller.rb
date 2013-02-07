class WinnersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @raffles = Raffle.where(:raffle_owner => current_user.email)
  end

  def show
    @winners = Entry.where(:raffle_id => params[:id]).where(:winner => true)
  end

  def winner
    @entries = Entry.where(:raffle_id => params[:raffle_id])
    @raffle = Raffle.find(params[:raffle_id])
    @prizes = Prize.where(:raffle_id => params[:raffle_id])
    @winners = []
    index = 0
    winners_email = []
    @raffle.num_prizes.times do
      begin
        winner = rand(@entries.count + 1)
      end until @winners.include?(@entries[winner]) == false && @entries[winner] != nil && @entries[winner].confirmed == true && @entries[winner].winner == false && winners_email.include?(@entries[winner].email) == false 	
      @winners[index] = @entries[winner]
      @winners[index].winner = true
      @winners[index].prize = @prizes[index].prize_name
      @winners[index].save
      winners_email.push(@winners[index].email)
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
    @entries = Entry.where(:raffle_id => params[:id])
    @entries.each do |e|
      e.destroy
    end
  end

  def send_mail
    if params[:cancel] != nil
      redirect_to winners_path
    else
      @raffle = Raffle.find(params[:id])
      @winners = Entry.where(:raffle_id => params[:id]).where(:winner => true)
      @winners.each_with_index do |e, index|
        EntryMailer.message_winners(e, @raffle, params[:message]).deliver
      end
      flash[:notice] = "Emails sent"
      redirect_to winners_path
    end
  end

  def download
    @raffle = Raffle.find(params[:id])
    fname = Rails.root.to_s + "/tmp/" + current_user.email + "_entries.csv"
    if File.exists?(fname)
      File.delete(fname)
      @entries = Entry.where(:raffle_id => @raffle.id)
      File.open(fname, "a") do |file|
        @entries.each_with_index do |e, index|
          if @entries[index].name != nil || @entries[index].email != nil && @entries[index].confirmed == true
            file.puts @entries[index].name + "," + @entries[index].email
          end
        end
      end
    else
      @entries = Entry.where(:raffle_id => @raffle.id)
      File.open(fname, "a") do |file|
        @entries.each_with_index do |e, index|
          if @entries[index].name != nil || @entries[index].email != nil && @entries[index].confirmed == true
            file.puts @entries[index].name + "," + @entries[index].email
          end
        end
      end
    end
    send_file fname
  end
end
