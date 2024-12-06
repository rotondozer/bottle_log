class AddBottleTable < ActiveRecord::Migration[8.0]
  def change
    create_table :bottles do |t|
      t.decimal :amount, null: false
      t.datetime :started_at
      t.datetime :finished_at
      t.timestamps
    end
  end
end
