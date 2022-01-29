# Сервис удаления записи о преподавателе
class TeacherServices::Destroy < ApplicationService
  def call(id)
    teacher = Teacher.find(id)
    unless Lesson.find_by(teacher: teacher)
      teacher.destroy
    else
      false
    end
  end
end
