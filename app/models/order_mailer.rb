class OrderMailer < ActionMailer::Base
  
  def order(user)
    subject    'Your order has been accepted'
    recipients user.email
    from       'noreply@rwpgroup.com'
    sent_on    Time.now
    
    body      :user => user
  end
  
  def order_notice
    subject    'New Order'
    recipients ADMIN_EMAIL
    from       'noreply@rwpgroup.com'
    sent_on    Time.now
  end
end
