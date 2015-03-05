class AddColumnsToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :attachment, :string
  end
end
