class Usermailer < ApplicationMailer
    def confirmation_email(order)
        @order = order
        @url  = 'http://0.0.0.0:3000'
       byebug
        mail(to: @order.email, subject: "Order: #{@order.id}")
      end
end
