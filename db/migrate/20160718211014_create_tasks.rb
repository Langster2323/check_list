class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :list, foreign_key: true
      t.string :body, null: false
      t.integer :list_id
      t.boolean :completed

      t.timestamps
    end
  end
end
