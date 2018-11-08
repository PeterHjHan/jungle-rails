class VisitorsController < ApplicationController

  def new
  end

  def create
    user = Visitor.new(user_params)
    if user.save
      session[:visiro_id] = visitor.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  def visitor_params
    params.require(:visitor).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
