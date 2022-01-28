# Метод удаления записи о преподавателе
class Teacher::DestroyTeacher < BaseInteractor
  def call(id)
    teacher = Teacher.find(id)
    unless Lesson.find_by(teacher: teacher)
      teacher.destroy
    else
      false
    end
  end
end