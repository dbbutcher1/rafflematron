class CreateWinners < ActiveRecord::Migration
  def change
    create_table :winners do |t|

      t.timestamps
    end
  end
end
