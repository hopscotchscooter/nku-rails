class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :score
      t.integer :total

      t.timestamps
    end
  end
end
