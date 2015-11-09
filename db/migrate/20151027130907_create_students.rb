class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.integer :height

      t.timestamps null: false
    end
    add_column :students,:teacher_id,:integer
    add_index :students,:teacher_id
  end
end
