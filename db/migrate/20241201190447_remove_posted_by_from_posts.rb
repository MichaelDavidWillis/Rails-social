class RemovePostedByFromPosts < ActiveRecord::Migration[8.0]
  def change
    remove_column :posts, :posted_by, :string
  end
end
