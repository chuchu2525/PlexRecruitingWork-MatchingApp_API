class CreateRecruitments < ActiveRecord::Migration[8.0]
  def change
    create_table :recruitments do |t|
      t.references :company_profile, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
