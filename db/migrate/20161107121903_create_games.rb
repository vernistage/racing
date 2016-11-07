class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :winner

      t.timestamps(null: false)
    end
  end
end
