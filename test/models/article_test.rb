require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    stub_request(:any, /newsapi/).to_return({body: top_headlines_response})
    @response = Article.get_top_headlines('Technology').first
    @news_source = create(:news_source, name: "News Source")
    @article = create(:article)
  end

  test ".get_top_headlines returns a formatted response" do
    assert_equal "Test Author", @response.author
    assert_equal "Some Test Title", @response.title
  end

  test ".get_date returns a string formatted date" do
    date = Article.get_date(@response)

    assert_equal Date.yesterday.to_s, date
  end

  test ".creator saves an article to the database" do
    assert_changes -> { Article.count } do
      new_article = Article.creator(@response, @article.topic)
    end
  end

  test "#summarize returns false for articles from a previous date" do
    @article.update(date: 'not_a_date')
    @article.reload
    stub_request(:any, /aylien/).to_return({body: summarized_response})

    assert_no_changes -> { @article.body } do
      @article.summarize
    end
  end

  test "#summarize returns a newly summarized body for current articles" do
    stub_request(:any, /aylien/).to_return({body: summarized_response})

    assert_changes -> { @article.body } do
      @article.summarize
    end
  end

  private

  def summarized_response
    {
      sentences: %w[sentence1 sentence2 sentence3]
    }.to_json
  end

  def top_headlines_response
    {
      "status": "ok",
      "totalResults": 1,
      "articles": [
        {
          "source": {
              "id": nil,
              "name": "News Source"
          },
          "author": "Test Author",
          "title": "Some Test Title",
          "description": "Some Test Description",
          "url": "https://someurl.com/",
          "urlToImage": "https://someurl.com",
          "publishedAt": Date.yesterday.to_s,
          "content": "Some Test Content"
        }
      ]
    }.to_json
  end
end
