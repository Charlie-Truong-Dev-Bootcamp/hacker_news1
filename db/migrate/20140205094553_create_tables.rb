class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash
      t.text :about
      t.string :email
      t.timestamps
    end

    create_table :posts do |t|
      t.string :url
      t.string :title
      t.belongs_to :user
      t.timestamps
    end

    create_table :comments do |t|
      t.text :content
      t.belongs_to :post
      t.belongs_to :user
      t.timestamps
    end

    add_index :posts, :user_id
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
