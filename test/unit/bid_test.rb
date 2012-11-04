require 'test_helper'

class BidTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Bid.new.valid?
  end
end
