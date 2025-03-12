class AddNameToStudentProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :student_profiles, :name, :string
  end
end
