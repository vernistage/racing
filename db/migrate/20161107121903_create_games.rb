class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :start
      t.string :finished
      t.integer :duration
      t.string :winner

      t.timestamps(null: false)
    end
  end
end
