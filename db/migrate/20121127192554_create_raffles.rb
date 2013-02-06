class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.integer :id
      t.string :uri
      t.string :name
      t.integer :num_prizes
      t.integer :num_entries
      t.string :raffle_owner
      t.boolean :has_winner
      t.string :winner
      t.boolean :editing
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
