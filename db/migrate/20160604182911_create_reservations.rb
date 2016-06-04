class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :permit_quantity
      t.integer :lodging_quantity
      t.date :permit_start_date
      t.date :permit_end_date
      t.integer :total_cost
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
