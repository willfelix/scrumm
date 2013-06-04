class ChangeTypeForKindFromPoints < ActiveRecord::Migration
  def change
	rename_column :Points, :type, :kind
  end
end
