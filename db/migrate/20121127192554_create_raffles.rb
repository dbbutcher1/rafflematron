class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.integer :id
      t.string :name
      t.integer :num_prizes
      t.integer :num_entries
      t.string :raffle_owner
      t.boolean :has_winner
      t.string :winner

      t.timestamps
    end
  end
end
