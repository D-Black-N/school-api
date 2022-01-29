module TeacherServices
  class Create < ApplicationService
    def call(teacher_params)
      teacher = Teacher.new(fio: teacher_params[:fio])
      if teacher.save
        teacher_params[:subjects].each do |value|
          subject = Subject.find(value[:id])
          TeacherSubject.create(teacher: teacher, subject: subject)
        end
        {teacher: teacher, subjects: teacher.subjects}
      else
        teacher.errors 
      end
    end
  end
end