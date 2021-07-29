require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  setup do
    @topic = create(:topic)
  end

  test ".list returns an array of topics" do
    assert_instance_of Array, Topic.list
  end

  test "#serve returns an array of articles of the current topic from the current day" do
    create(:article, topic: @topic)
    create(:article, topic: @topic, date: "not_a_date")
    create(:article)

    assert_equal 1, @topic.serve.count
  end
end
