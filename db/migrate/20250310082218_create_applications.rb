class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.references :student_profile, null: false, foreign_key: true
      t.references :recruitment, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
