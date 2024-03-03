class CreateExperience < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.string :job_title
      t.string :period
      t.text :description

      t.timestamps
    end
  end
end
