class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatars, :json
  end
end
