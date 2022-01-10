class Teacher < ApplicationRecord
    # многие-ко-многим с учебными предметами
    has_many :subjects, through: :teacher_subjects
    has_many :teacher_subjects

    # один-к-одному с уроком
    belongs_to :lesson

    # валидации ФИО
    validates :fio, format: { with: /^[А-Я][а-я]+\s[А-Я]\.[А-Я]\.$/ }
end
