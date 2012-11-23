#coding: UTF-8
class OrderNotifier < ActionMailer::Base
  default from: 'Ksiegarnia Śląska <ksiegarnia@slaska.pl>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Księgarnia Śląska - 
      Potwierdzenie zamówienia'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
 def shipped(order)
    @order = order
    mail to: order.email, subject: 'Księgarnia Śląska 
            - zamówienie zostało wysłane'
  end

	
 
end
