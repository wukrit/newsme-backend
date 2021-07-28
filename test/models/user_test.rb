require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    sub = create(:subscription, user: @user)
    @article = create(:article, topic: sub.topic)
  end

  test '#serve' do
    user_feed = @user.serve
    expected_feed = { "Technology" => [@article] }
    assert_equal expected_feed, user_feed
  end
end
