class CreateProject < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :team_size
      t.string :prosition
      t.text :description

      t.string :project_type
      t.string :url

      t.timestamps
    end
  end
end
