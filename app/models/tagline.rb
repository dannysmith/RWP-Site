class Tagline < ActiveRecord::Base
  
  #Returns a random tagline title unless given the true argument, when it returns a random tagline object.
  def self.random(body = false)
    if body
      return self.all[rand(6)]
    else
      return self.all[rand(6)].tagline
    end
  end
end
