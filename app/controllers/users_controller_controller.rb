class UsersControllerController < ApplicationController
  def users
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to microposts_url }
      format.json { head :no_content }
    end
  end
end
