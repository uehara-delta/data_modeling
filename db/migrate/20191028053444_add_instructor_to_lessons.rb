class AddInstructorToLessons < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :instructor
  end
end
