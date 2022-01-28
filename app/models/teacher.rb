class Teacher < ApplicationRecord
    # многие-ко-многим с учебными предметами
    has_many :teacher_subjects, dependent: :destroy
    has_many :subjects, through: :teacher_subjects

    # разрешение атрибутов предметов (для связи многие-ко-многим)
    accepts_nested_attributes_for :subjects

    # один-к-одному с уроком
    has_many :lessons

    # валидации ФИО
    validates :fio, format: { with: /[А-Я][а-я]+\s[А-Я]\.[А-Я]\./ }
end
