class RemoveIndexToPost < ActiveRecord::Migration[7.1]
  def change
    remove_index :posts, :author_id
    add_index :posts, :author_id, unique: false, name: 'index_my_name'
  end
end
