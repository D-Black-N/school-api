# Сервис обновления данных о преподавателе
class TeacherServices::Update < ApplicationService
  def call(update_params)
    teacher = Teacher.find(update_params[:id])
    teacher.update(fio: update_params[:fio])
    new_subjects = update_params[:subjects]
    teacher.subjects.each do |subj|
      find_res = new_subjects.detect { |value| value[:id].to_i == subj.id }
      if find_res.nil?
        TeacherSubject.find_by(teacher: teacher, subject: Subject.find(subj[:id])).destroy
      else
        new_subjects.delete(find_res)
      end
    end
    unless new_subjects.empty?
      new_subjects.each { |element| TeacherSubject.create(teacher: teacher, subject: Subject.find(element[:id])) }
    end
    {teacher: teacher, subjects: teacher.subjects}
  end
end
