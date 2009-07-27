module OrdersHelper
  #Returns the name of the latest status as a string.

  
  #Includes the date that it was modified.
  def current_status_w_date(order)
    s = order.status
    return "#{s.name} <span>(as of #{s.date.strftime('%d/%m/%y %H:%M')})</span>"
  end
end