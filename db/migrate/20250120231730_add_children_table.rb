class AddChildrenTable < ActiveRecord::Migration[8.0]
  def change
    create_table :children do |t|
      t.string :name, null: false
      t.datetime :date_of_birth

      t.timestamps
    end

    add_reference :bottles, :child, foreign_key: {to_table: :children}, null: false
  end
end
