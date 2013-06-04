class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :sprint
      t.references :status
	  t.references :project
      t.references :responsible
	  t.references :point
      t.text :description
	  t.boolean :unplanned
	  
      t.timestamps
    end
	
    add_index :tasks, :sprint_id
    add_index :tasks, :status_id
	add_index :tasks, :project_id
    add_index :tasks, :responsible_id
	add_index :tasks, :point_id
	
  end
end
