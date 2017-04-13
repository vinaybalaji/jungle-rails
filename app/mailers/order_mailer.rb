class OrderMailer < ApplicationMailer

  def order_confirmation_email(order)
      @order = order
      @line_items = LineItem.where(order_id: @order.id)
      mail(to: @order.email, subject: 'Your Jungle Order#' + @order.id.to_s + 'has been placed.')
  end
end
