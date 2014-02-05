class NewTables < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.boolean :vote
      t.timestamps
    end

    create_table :comment_votes do |t|
      t.belongs_to :comment
      t.belongs_to :user
      t.boolean :vote
      t.timestamps
    end

    add_index :post_votes, :post_id
    add_index :post_votes, :user_id
    add_index :comment_votes, :comment_id
    add_index :comment_votes, :user_id
  end
end
