class AddIndexToTask < ActiveRecord::Migration
  def change
    add_index :tasks, :points_id
  end
end
