class UserMailer < ApplicationMailer

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  # def order_email

  # mail(to: "no-reply@jungle.com ", subect: )

  # end
end
