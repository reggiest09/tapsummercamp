class CreateChildrenNames < ActiveRecord::Migration
 def change
    create_table :children_names do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :grade
      t.string :school_name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
