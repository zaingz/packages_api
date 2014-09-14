class ChangingNameOfLngColumn < ActiveRecord::Migration
  def change
    remove_column :users, :lng
    add_column :users , :lon, :float
  end
end
