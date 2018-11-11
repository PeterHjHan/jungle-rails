class UserMailer < ApplicationMailer

def order_email(order)
  @order = order
  mail(to: "no-reply@jungle.com ", subect: "Receipt for your Order: #{@order.id}")
  end
end
