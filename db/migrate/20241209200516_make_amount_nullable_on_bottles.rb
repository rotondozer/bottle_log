class MakeAmountNullableOnBottles < ActiveRecord::Migration[8.0]
  def change
    change_column_null :bottles, :amount, true
    rename_column :bottles, :finished_at, :ended_at
  end
end
