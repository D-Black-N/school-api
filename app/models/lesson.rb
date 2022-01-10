# модель уроков
class Lesson < ApplicationRecord
    # отношение принадлежности к предметам и преподавателям
    belongs_to :teacher, foreign_key: "teacher_id"
    belongs_to :subject, foreign_key: "subject_id"

    # Валидация полей при работе с данными модели
    validates :class_id, length: { in: 1..3 }
    validates :time_start, :time_end, presence: true
end
