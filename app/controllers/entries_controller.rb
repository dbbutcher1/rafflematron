class EntriesController < ApplicationController
  def index
    @raffles = Raffle.all
  end

  def enter
  end
  
  def confirm
  end
end
