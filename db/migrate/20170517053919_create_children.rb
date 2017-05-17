class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :grade
      t.date :dob
      t.string :home_address
      t.integer :shirt_size
      t.integer :short_size
      t.text :allergies
      t.string :soccer_postiion,array: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
