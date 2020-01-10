class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.string :description
      t.string :img
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end,
    add_index :projects, [:user_id, :created_at]
  end
end
