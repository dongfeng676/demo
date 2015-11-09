class RenameCommnetsCountFromAritcle < ActiveRecord::Migration
  def change
    rename_column :articles , :commnets_count,:comments_count
  end
end
