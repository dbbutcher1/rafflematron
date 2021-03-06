class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.integer :raffle_id
      t.string :name
      t.string :email
      t.integer :token
      t.boolean :winner, :default => false
      t.string :prize, :default => nil
      t.boolean :confirmed, :default => false
    end
  end

  def down
  end
end
