class CreateServeAppRelations < ActiveRecord::Migration
  def change
    create_table :serve_app_relations do |t|
      t.references :server, index: true, foreign_key: true
      t.references :app, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
