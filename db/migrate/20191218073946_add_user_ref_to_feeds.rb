class AddUserRefToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_reference :feeds, :users, foreign_key: true
  end
end
