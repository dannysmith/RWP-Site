require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  def test_update_invalid
    Page.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Page.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Page.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Page.first
    assert_redirected_to root_url
  end
  
  def test_edit
    get :edit, :id => Page.first
    assert_template 'edit'
  end
end
