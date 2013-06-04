class RemoveColumnPointsIdFromTask < ActiveRecord::Migration
  def change
	remove_column :tasks, :points_id
  end
end
