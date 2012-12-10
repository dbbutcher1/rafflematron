class CreateEntries < ActiveRecord::Migration
  def up
    create_table :entries do |t|
      t.integer :raffle_id
      t.string :name
      t.string :email
    end
  end

  def down
  end
end
