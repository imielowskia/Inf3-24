class AddFieldToGroup < ActiveRecord::Migration[7.1]
  def change
    add_reference :groups, :field, null: true, foreign_key: true
  end
end
