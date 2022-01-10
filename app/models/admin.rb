# модель администратора для входа в админку
class Admin < ApplicationRecord

    # валидация полей модели 
    validates :name,  presence: true, length: { maximum: 20 }
    validates :password, presence: true, length: { minimum: 6 }

    # шифрование пароля
    has_secure_password
end
