# Модель учебных предметов
class Subject < ApplicationRecord
    # многие-ко-многим с учителями
    has_many :teacher_subjects
    has_many :teachers, through: :teacher_subjects

    # разрешение атрибутов предметов и расписания (для связи многие-ко-многим)
    accepts_nested_attributes_for :teachers
    
    # один-к-одному с уроком
    has_many :lessons

    # валидация наименования
    validates :name, length: {minimum:3, maximum:18}, uniqueness: true
end
