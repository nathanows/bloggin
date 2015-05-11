class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :author, null: false
      t.string :status, null: false, default: 'draft'

      t.timestamps null: false
    end
  end
end
