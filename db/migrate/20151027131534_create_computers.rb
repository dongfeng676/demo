class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :name
      t.string :version

      t.timestamps null: false
    end
  end
end
