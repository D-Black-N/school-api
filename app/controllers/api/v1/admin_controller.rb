# контроллер администратора
class Api::V1::AdminController < ApplicationController

  # Получение данных администраторе при авторизации
  # POST autorization
  def autorize
    admin = Admin.find_by(name: params[:name])
    if admin && admin.authenticate(params[:password])
      render json: { admin: admin.id }
    else
      render json: { message: 'Неверный логин или пароль' }
    end
  end

  # Получения данных для изменения аккаунта администратора
  # GET admin/:id/edit
  def edit
    render json: Admin.find(params[:id])
  end

  # Обновление учетной записи администратора
  # POST admin
  def update
    admin = Admin.find(params[:id])
    if admin.update(update_admin)
      render json: admin.name
    else
      render json: admin.errors
    end
  end

private

  def update_admin
    params.require(:admin).permit(:name, :password, :password_confirmation)
  end
end
