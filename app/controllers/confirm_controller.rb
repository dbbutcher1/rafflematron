class ConfirmController < ApplicationController

  def confirm
    @user = Entry.where(:token => params[:token])
    if @user[0].confirmed == true
      flash[:notice] = "Already Confirmed"
      redirect_to root_path
    else
      @user[0].confirmed = true
      @user[0].save
    end
  end
end
