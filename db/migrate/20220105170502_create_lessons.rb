# миграция для создания таблицы уроков для отображения расписания
class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :class_id
      t.datetime :time_start
      t.datetime :time_end
      t.references :weekday, index: true, foreign_key: true, null: false
      t.references :teacher, index: true, foreign_key: true, null: false
      t.references :subject, index: true, foreign_key: true, null: false

    end

    add_index :lessons, [:time_start, :time_end, :class_id]
  end
end
