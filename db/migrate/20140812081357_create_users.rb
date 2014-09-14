class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, default: "", limit: 15
      t.string :email, null: false, default: ""
      t.string :password_digest

      t.timestamps
    end
  end
end
