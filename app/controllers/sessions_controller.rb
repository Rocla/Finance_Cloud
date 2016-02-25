class SessionsController < ApplicationController
  def new
  end

  def create
    if validate_email(params[:session][:email])
      user = User.find_by(email: params[:session][:email].downcase)
      if user
        if user.authenticate(params[:session][:password])
          flash[:success] = "You are now logged in!"
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          # TODO give email has argument
          flash[:error] = "Your password is incorrect"
          render 'new'
        end
      else
        # TODO give email has argument
        flash[:error] = "Non-existing email address"
        render 'new'
      end
    else
      flash[:error] = "Wrong email format"
      # TODO give email has argument
      render 'new'
    end


  end

  def destroy
    flash[:success] = "You have now logged out"
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def user_values
      params.require(:user).permit(:username, :email, :password)
    end
    def validate_email(email)
      email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    end
end
