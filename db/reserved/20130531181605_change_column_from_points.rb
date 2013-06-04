class ChangeColumnFromPoints < ActiveRecord::Migration
  def change
	rename_column :points, :number, :name
  end
end
