class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.text :content
      t.string :status
      t.boolean :is_priority

      t.timestamps
    end
  end
end
