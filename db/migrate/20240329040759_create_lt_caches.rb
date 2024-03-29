class CreateLtCaches < ActiveRecord::Migration[7.1]
  def change
    create_table :lt_caches do |t|
      t.string :key, null: false
      t.jsonb :value, null: false, default: {}

      t.index :key
      t.timestamps
    end
  end
end
