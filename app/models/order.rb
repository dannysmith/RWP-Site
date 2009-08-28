class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :states
  
public


  def status
    self.states.find(:last, :order => "date asc")
  end
  
  def status=(str)
    self.states.create(:name => str, :date => Time.now).save!
  end

  def paypal_url(return_url)
    values = {
      :business => 'seller_1248691620_biz@sussex.ac.uk',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    values.merge!({
        "amount_1" => self.total.to_f/100,
        "item_name_1" => "Payment to RWP"
      })
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
