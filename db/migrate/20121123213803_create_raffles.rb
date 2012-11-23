class CreateRaffles < ActiveRecord::Migration
  def change
    create_table :raffles do |t|
      t.string :Name
      t.string :Prize
      t.date :Start
      t.date :end

      t.timestamps
    end
  end
end
