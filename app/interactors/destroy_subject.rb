# удаление записи об учебном предмете
class DestroySubject < BaseInteractor
    def call(sub)
        subject = Subject.find(sub)
        unless subject.teachers
            subject.delete
            return true
        else
            return false
        end
    end
end
