class TeacherSubject < ApplicationRecord
    # отношение принадлежности к таблицам предметов и преподавателей
    belongs_to :subject  
    belongs_to :teacher
end
