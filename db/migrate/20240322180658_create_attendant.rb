class CreateAttendant < ActiveRecord::Migration[7.1]
  def change
    create_table :attendants do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.date :data

      t.timestamps
    end
  end
end
