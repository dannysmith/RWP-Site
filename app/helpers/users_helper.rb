module UsersHelper
  def email_link(user)
    e = user.email
    n = "Send email to #{user.first_name} #{user.surname}."
    return "<a title=\"#{n}\" href=\"mailto:#{e}\">#{e}</a>"
  end
  
  def short_date(datetime)
    datetime.strftime("%b %y")
  end
  
  def name(user)
    txt = user.surname + ", " + user.first_name
    #return link_to "#{txt}", :controller => 'users', :action => 'edit'
  end
end
