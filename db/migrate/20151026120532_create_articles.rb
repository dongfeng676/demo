class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :text
      t.integer :lock_version

      t.timestamps null: false
    end
  end
end
