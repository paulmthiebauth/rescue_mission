class UsersController < ApplicationController

def new
  @user = User.new
end

def show
  if params["id"] == "sign_out"
    flash[:notice] = ["You've successfully signed out."]
    redirect_to '/questions'
  end
end

end
