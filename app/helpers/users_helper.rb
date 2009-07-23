module UsersHelper
  def email_link(user)
    e = h user.email
    n = "Send email to #{h(user.first_name)} #{h(user.surname)}."
    return "<a title=\"#{n}\" href=\"mailto:#{e}\">#{e}</a>"
  end
  
  def short_date(datetime)
    datetime.strftime("%b %y")
  end
  
  def name(user)
    txt = h(user.surname) + ", " + h(user.first_name)
    #return link_to "#{txt}", :controller => 'users', :action => 'edit'
  end
end
