require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Bid.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Bid.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Bid.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to bid_url(assigns(:bid))
  end

  def test_edit
    get :edit, :id => Bid.first
    assert_template 'edit'
  end

  def test_update_invalid
    Bid.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bid.first
    assert_template 'edit'
  end

  def test_update_valid
    Bid.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bid.first
    assert_redirected_to bid_url(assigns(:bid))
  end

  def test_destroy
    bid = Bid.first
    delete :destroy, :id => bid
    assert_redirected_to bids_url
    assert !Bid.exists?(bid.id)
  end
end
