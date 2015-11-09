class AddCommentsCountToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :commnets_count, :integer
  end
end
