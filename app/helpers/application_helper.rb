# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  #Converts an Integer price in pennies into a nicely formatted string.
  def to_price(number)
    number_to_currency((number.to_f)/100, :delimiter => ",", :unit => "&pound;",:separator => ".")
  end

  def breadcrumbs(sep = "»", include_home = true)
      levels = request.path.split('?')[0].split('/')
      levels.delete_at(0)

      links = ""
      links += content_tag('a', "Home", :href => "/") if include_home

      levels.each_with_index do |level, index|
        links += " #{sep} #{content_tag('a', level.downcase.gsub(/_/, ' ').gsub(/-/, ' ').titleize, :href => '/'+levels[0..index].join('/'))}"
      end

      content_tag("div", content_tag("p", links ), :id => "breadcrumb")
    end
end
