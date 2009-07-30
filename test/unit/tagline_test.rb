require 'test_helper'

class TaglineTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Tagline.new.valid?
  end
end
