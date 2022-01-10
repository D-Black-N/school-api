class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :fio

    end

    add_index :teachers, :fio
  end
end
