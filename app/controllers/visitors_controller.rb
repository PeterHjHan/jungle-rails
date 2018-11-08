class VisitorsController < ApplicationController

  def new
  end

  def create
    visitor = Visitor.new(user_params)
    if visitor.save
      session[:visitor_id] = visitor.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  def user_params
    params.require(:visitor).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
