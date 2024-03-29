class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.string :major
      t.text :description
      t.string :graduation_date
      t.string :start_date
      t.string :gpa

      t.timestamps
    end
  end
end
