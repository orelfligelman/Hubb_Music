class AddCarrierWaveColumnsToMusic < ActiveRecord::Migration
  def change
    add_column :musics, :name, :string
  end
end
