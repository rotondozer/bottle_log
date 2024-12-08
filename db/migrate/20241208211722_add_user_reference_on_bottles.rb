class AddUserReferenceOnBottles < ActiveRecord::Migration[8.0]
  def change
    add_reference :bottles, :user, null: false, foreign_key: true
  end
end
