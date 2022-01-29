# удаление записи об учебном предмете
module SubjectActions
  class Destroy < ApplicationService
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
end
