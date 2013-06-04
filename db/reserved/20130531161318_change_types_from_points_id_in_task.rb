class ChangeTypesFromPointsIdInTask < ActiveRecord::Migration

  def change
	change_column :tasks, :point_id, :integer
  end

end
