class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :sname
      t.string :indeks, limit: 5
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
