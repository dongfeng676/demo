class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :age
      t.integer :height
      t.string :phone
      t.string :address

      t.timestamps null: false
    end
  end
end
