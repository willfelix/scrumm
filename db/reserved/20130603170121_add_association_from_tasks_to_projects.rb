class AddAssociationFromTasksToProjects < ActiveRecord::Migration
  def change
	add_column :tasks, :project, :string
	
	add_index :tasks, :project_id
  end
end
