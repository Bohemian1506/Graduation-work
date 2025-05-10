class DropPostsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :posts if table_exists?(:posts)
  end

  def down
    create_table :posts do |t|
      t.string :title
      t.timestamps
    end
  end
end
