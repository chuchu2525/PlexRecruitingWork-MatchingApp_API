class Api::V1::StudenProfilesController < ApplicationController
  def index
    @student_profiles = StudentProfile.all
    render json: @student_profiles
  end

  def show
    @student_profile = StudentProfile.find(params[:id])
    render json: @student
  end

  def create
    @student_profile = StudentProfile.new(student_profile_params)
    if @student_profile.save
      render json: @student_profile, status: :created
    else
      render json: @student_profile.errors, status: :unprocessable_entity
    end
  end
 
  def update
    @student_profile = StudentProfile.find(params[:id])
    if @student_profile.update(student_profile_params)
      render json: @student_profile
    else
      render json: @student_profile.errors, status: :unprocessable
    end
  end
  
  def destroy
    @student_profile = StudentProfile.find(params[:id])
    @student_profile.destroy
  end

  private
  def student_profile_params
    params.require(:student_profile).permit(:user_id, :name, :grade, :university, :faculty, :self_introduction, :experience)
  end
end
