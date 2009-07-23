class SignupMailer < ActionMailer::Base
  

  def confirm(user)
    subject    'Your account at RWP has been activated'
    recipients user.email
    from       'noreply@rwpgroup.com'
    sent_on    Time.now
    
    body       :user => user
  end
  
  def confirm_to_rwp(user)
    subject    'A user has signed up at your website'
    recipients ADMIN_EMAIL
    from       'noreply@rwpgroup.com'
    sent_on    Time.now
    
    body       :user => user
  end
end
