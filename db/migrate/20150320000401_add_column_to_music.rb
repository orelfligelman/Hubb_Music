class AddColumnToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :objID, :string
    add_column :musics, :sessiontoken, :string
  end
end
