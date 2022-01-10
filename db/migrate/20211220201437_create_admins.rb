class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name, index: true, unique: true, null: false
      t.string :password_digest, null: false

    end
  end
end
