class CreateWeekDays < ActiveRecord::Migration[6.1]
  def change
    create_table :weekdays do |t|
      t.string :day, index: true, unique: true, null: false

    end
  end
end
