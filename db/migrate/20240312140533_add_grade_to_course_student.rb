class AddGradeToCourseStudent < ActiveRecord::Migration[7.1]
  def change
    rename_table 'courses_students', 'grades'
    add_column :grades, :grade, :decimal, precision: 4, scale: 1
  end
end
