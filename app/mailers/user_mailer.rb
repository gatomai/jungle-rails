class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(order)
    @order = order
    @order_items = order.line_items
    mail(to: @order.email, subject: 'Order has been received')
  end
end
