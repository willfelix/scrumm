class AddColumnPointIdToTask < ActiveRecord::Migration
  def change
	add_column :tasks, :point_id, :integer
  end
end
