class CreateJoinTableCourseStudent < ActiveRecord::Migration[7.1]
  def change
    create_join_table :courses, :students, primary_key: [:course_id, :student_id] do |t|
      # t.index [:course_id, :student_id]
      # t.index [:student_id, :course_id]
    end
  end
end
