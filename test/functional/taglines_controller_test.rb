require 'test_helper'

class TaglinesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Tagline.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Tagline.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Tagline.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tagline_url(assigns(:tagline))
  end
  
  def test_edit
    get :edit, :id => Tagline.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Tagline.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tagline.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Tagline.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tagline.first
    assert_redirected_to tagline_url(assigns(:tagline))
  end
  
  def test_destroy
    tagline = Tagline.first
    delete :destroy, :id => tagline
    assert_redirected_to taglines_url
    assert !Tagline.exists?(tagline.id)
  end
end
