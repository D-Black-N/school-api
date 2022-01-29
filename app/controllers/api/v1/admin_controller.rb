# контроллер администратора
class Api::V1::AdminController < ApplicationController

  # Получение данных об администраторе при авторизации
  # GET admin
  def autorize
    admin = Admin.find_by(name: params[:name])
    if admin && admin.authenticate(params[:password])
      render json: { admin: [admin.id, admin.name] }
    else
      render json: { message: 'Неверный логин или пароль' }
    end
  end

  # Обновление учетной записи администратора
  # POST admins
  def update
    # admin = Admin.find(params[:id])
    if params[:admin].has_key? 'password'
      admin.update(update_admin)
    else
      admin.update(name: params[:admin][:name])
    end
    render json: admin
  end

private

  def update_admin
    params.require(:admin).permit(:name, :password, :password_confirmation)
  end
end
