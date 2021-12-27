class Api::V1::AdminController < ApplicationController

  def autorize
    admin = Admin.find_by(name: params[:name])
    if admin && admin.authenticate(params[:password])
      render json: { admin: admin.name }
    else
      render json: { message: 'Неверный логин или пароль' }
    end
  end

  def subjects
    subjects = [
      {id: 1, name: "Математика"},
      {id: 2, name: "Русский язык"},
      {id: 3, name: "Литература"},
      {id: 4, name: "Физика"},
    ]
    render json: subjects 
  end

  def teachers
    subjects = [
      {id: 1, name: "Математика"},
      {id: 2, name: "Русский язык"},
      {id: 3, name: "Литература"},
      {id: 4, name: "Физика"},
    ]
    teachers = [
      {id: 1, fio: "Синицын А.А", lessons: [subjects[0][:name], subjects[3][:name]]},
      {id: 2, fio: "Петров А.А", lessons: [subjects[1][:name], subjects[2][:name]]},
    ]
    render json: teachers
  end

  private
  
  def permit_autorization_params
    params.require(:admin).permit(:name, :password)
  end
end
