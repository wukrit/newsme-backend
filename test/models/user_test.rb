require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = create(:user)
    sub = create(:subscription, user: @user)
    @article = create(:article, topic: sub.topic)
  end

  test '#serve generates a user news feed' do
    user_feed = @user.serve
    expected_feed = { "Technology" => [@article] }
    assert_equal expected_feed, user_feed
  end

  test '#send_newsletter sends an email' do
    @user.send_newsletter

    assert_emails 1
  end

  test '.send_newsletters sends an email for each user' do
    new_user = create(:user)
    new_sub = create(:subscription, user: new_user, topic: @article.topic)

    assert_emails 2 do
      User.send_newsletters
    end
  end
end
