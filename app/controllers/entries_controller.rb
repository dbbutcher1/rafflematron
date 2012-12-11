class EntriesController < ApplicationController
  def index
    @raffles = Raffle.all
  end

  def enter
  end
  
  def confirm
    @entry = Entries.create!(:name => params[:name], :email => params[:email])
  end
end
