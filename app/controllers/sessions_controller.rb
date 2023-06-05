class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email"=>params["email"]})
    #user autentication / do uname & pwrd match?
    if @user 
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hi!"
        redirect_to "/places"
      else
        flash["notice"] = "Incorrect Username or Password"
        redirect_to "/login"
      end
  end

  #below for logging out a user
  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye! Come again :)"
    redirect_to "/login"
  end
end
  