class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.integer :id
      t.string :name
      t.integer :prizes

      t.timestamps
    end
  end
end
