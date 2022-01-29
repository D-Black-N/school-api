# удаление записи об учебном предмете
class SubjectServices::Destroy < ApplicationService
  def call(id)
    subject = Subject.find(id)
    if subject.teachers.empty?
      subject.destroy
      return true
    else
      return false
    end
  end
end
