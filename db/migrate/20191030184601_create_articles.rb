class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :body
      t.string :url
      t.string :sentiment

      t.timestamps
    end
  end
end
