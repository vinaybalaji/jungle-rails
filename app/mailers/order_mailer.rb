class OrderMailer < ApplicationMailer

  def order_confirmation_email(order)
      @order = order
      # puts "?????????????"
      # puts @order
      # puts "?????????????"
      @line_items = LineItem.where(order_id: @order.id)
      puts "<<<<<<<<<<<>>>>>>>>>>>>"
      puts @order.email
      puts "<<<<<<<<<<<>>>>>>>>>>>>"
      mail(to: @order.email, subject: 'Your Jungle Order#' + @order.id.to_s + 'has been placed.')
  end
end
