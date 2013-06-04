class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :name
	  t.string :kind
	  
      t.timestamps
    end
	
  end
end
