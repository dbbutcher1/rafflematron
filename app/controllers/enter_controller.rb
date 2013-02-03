class EnterController < ApplicationController
  def enter
    begin
    raffle = Raffle.where(:uri => params[:uri])
    @entry = Entry.new
    @entry.raffle_id = raffle[0].id
    @entry.save
    rescue
      flash[:error] = "Not Found"
      redirect_to :root
    end
  end
end
