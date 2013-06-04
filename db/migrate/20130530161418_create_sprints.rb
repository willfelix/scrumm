class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.date :date_begin
      t.date :date_final
      t.string :name

      t.timestamps
    end
  end
end
