require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Email.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Email.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end

  def test_destroy
    email = Email.first
    delete :destroy, :id => email
    assert_redirected_to root_url
    assert !Email.exists?(email.id)
  end
end
