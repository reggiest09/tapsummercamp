class AddUserFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
    add_column :users, :school_name, :string
    add_column :users, :grade_year, :integer
    add_column :users, :home_address, :string
    add_column :users, :home_city, :string
    add_column :users, :home_state, :string
    add_column :users, :home_zip_code, :string
    add_column :users, :ada_accommodation, :text
    add_column :users, :parent_gurdin_email, :string
    add_column :users, :mother_name, :string
    add_column :users, :mother_day_number, :string
    add_column :users, :mother_cell_num, :string
    add_column :users, :father_name, :string
    add_column :users, :father_day_number, :string
    add_column :users, :father_cell_number, :string
    add_column :users, :persons_auth, :text
    add_column :users, :other_arrangements, :text
    add_column :users, :emergency_contact, :text
    add_column :users, :child_health_prob, :text
    add_column :users, :child_medication, :boolean
    add_column :users, :child_medication_desc, :text
    add_column :users, :snack, :text
  end
end
