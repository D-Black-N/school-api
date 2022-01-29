# контроллер управления списом преподавателей
class Api::V1::TeacherController < ApplicationController

  # Получение данных о списке преподавателей
  # GET teacher
  def index
    teachers = Teacher.all.map {|teacher| {teacher: teacher, subjects: teacher.subjects} }
    render json: teachers
  end

  # Добавление преподавателя в список
  # POST teacher
  def create
    render json: TeacherServices::Create.call(create_teacher_params)
  end

  # Обновление преподавателя в списке
  # PUT teacher
  def update
    render json: TeacherServices::Update.call(update_teacher_params)
  end

  # Удаление преподавателя из списка
  # DELETE teacher
  def destroy
    render json: TeacherServices::Destroy.call(params[:id])
  end

private

  def create_teacher_params
    params.require(:teacher).permit(:fio, subjects: [:id])
  end

  def update_teacher_params
    params.require(:teacher).permit(:id, :fio, subjects: [:id])
  end
end
