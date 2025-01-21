class MakeStartedAtNonNullOnBottles < ActiveRecord::Migration[8.0]
  def change
    change_column_null :bottles, :started_at, false
  end
end
