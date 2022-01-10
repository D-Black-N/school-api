# миграция таблицы для связи многие-ко-многим между преподавателями и предметами
class CreateTeacherSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_subjects do |t|
      t.references :subject, index: true, foreign_key: true, null: false
      t.references :teacher, index: true, foreign_key: true, null: false

    end
  end
end
