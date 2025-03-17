class Api::V1::ApplicationsController < ApplicationController
  def create
    application = Application.new(application_params)
    if application.save
      render json: application, status: :created
    else
      render json: application.errors, status: :unprocessable_entity
    end
  end

  def index
    applications = Application.all
    render json: applications.to_json(include: { student_profile: { include: :user }, recruitment: { include: :company_profile } })
  end

  private

  def application_params
    params.require(:application).permit(:student_profile_id, :recruitment_id, :status)
  end
end