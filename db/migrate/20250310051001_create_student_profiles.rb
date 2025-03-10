class CreateStudentProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :student_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :grade
      t.string :university
      t.string :faculty
      t.text :self_introduction
      t.text :experience

      t.timestamps
    end
  end
end
