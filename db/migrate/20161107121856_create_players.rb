class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username

      t.timestamps(null: false)
    end
    add_index :players, :username, :unique => true
  end
end
