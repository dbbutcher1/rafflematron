class EntriesController < ApplicationController
  @@entry_id = 1
  def index
    @raffles = Raffle.all
  end

  def enter
    @entry = Entry.new
    @entry.raffle_id = params[:raffle_id]
    @entry.save
    @@entry_id = @entry.id
  end
  
  def confirm
    @entry = Entry.find(@@entry_id)
    @entry.assign_attributes(:name => params[:name], :email => params[:email])
    @entry.save
  end
end
