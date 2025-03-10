class CreateCompanyProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :company_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.text :company_overview
      t.text :business_description
      t.text :job_description

      t.timestamps
    end
  end
end
