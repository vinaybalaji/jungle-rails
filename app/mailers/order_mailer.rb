class OrderMailer < ApplicationMailer

  def order_confirmation_email(order)
      @order = order
      mail(to: @order.email, subject: 'Your Jungle Order#' + @order.id.to_s + 'has been placed.')
  end
  
end
