class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :fio, index: true

    end
  end
end
