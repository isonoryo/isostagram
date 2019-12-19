class RenameUsersIdColumnToFeeds < ActiveRecord::Migration[5.2]
  def change
    rename_column :feeds, :users_id, :user_id
  end
end
