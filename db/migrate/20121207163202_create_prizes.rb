class CreatePrizes < ActiveRecord::Migration
  def change
    create_table :prizes do |t|

      t.string :prize_name
      t.integer :raffle_id
      t.timestamps
    end
  end
end
