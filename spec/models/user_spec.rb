require 'rails_helper'

# Test User model relationships
describe User, '#topics' do
  it 'returns a users topics' do
    # setup
    user = build(:user, username: 'john', email: 'johndoe@email.com', name: "John Doe")
    topic = build(:topic, title: 'Sports')
    user_topics = Topics.all.select do |topic|
      topic.user_id == user.id
    end

    # exercise
    result = user.topics

    # verify
    expect(result).to eq [user_topics]
  end
end