FactoryBot.define do
  factory :article do
    sequence :headline do |n|
      "Article Headline#{n}"
    end
    url { "https://somenewswebsite.com" }
    body { "sentence 1 \n sentence 2 \n sentence 3" }
    date { Date.today.to_s }
    topic
    news_source
  end
end