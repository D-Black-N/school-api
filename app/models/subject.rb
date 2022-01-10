# Модель учебных предметов
class Subject < ApplicationRecord
    # многие-ко-многим с учителями
    has_many :teachers, through: :teacher_subjects
    has_many :teacher_subjects

    # один-к-одному с уроком
    belongs_to :lesson

    # валидация наименования
    validates :name, length: {minimum:3, maximum:18}, uniqueness: true
end
