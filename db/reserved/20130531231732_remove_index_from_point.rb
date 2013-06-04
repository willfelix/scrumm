class RemoveIndexFromPoint < ActiveRecord::Migration
  def change
	remove_column :points, :task_id
  end
end
