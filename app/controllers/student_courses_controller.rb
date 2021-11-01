class StudentCoursesController < ApplicationController

  def create
    course_to_add = Course.find(params[:course_id])
    unless current_user.courses.include?(course_to_add)
      StudentCourse.create(course: course_to_add, student: current_user) #Rails automatically extracts the course id and student id to add the student_courses row
      flash[:notice] = "You have successfully enrolled in #{course_to_add.name}"
      redirect_to current_user
    else
      flash[:notice] = "Something was wrong with your enrollment"
      redirect_to_root_path
    end
  end
end
