class CreateWorkExps < ActiveRecord::Migration[7.1]
  def change
    create_table :work_exps do |t|
      t.string :company_name
      t.string :position
      t.string :start_time
      t.string :end_time
      t.text :description

      t.timestamps
    end
  end
end
