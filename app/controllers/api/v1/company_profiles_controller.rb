class Api::V1::CompanyProfilesController < ApplicationController
  def create
    @company_profile = CompanyProfile.new(company_profile_params)
    if @company_profile.save
      render json: @company_profile, status: :created
    else
      render json: @company_profile.errors, status: :unprocessable_entity
    end
  end

  def index
    @company_profiles = CompanyProfile.all
    render json: @company_profiles.to_json(include: { user: {only: :name}})
  end

  def show
    @company_profile = CompanyProfile.find(params[:id])
    render json: @company_profile.to_json(include: { user: { only: :name } })
  end

  private

  def company_profile_params
    params.require(:company_profile).permit(:user_id, :company_overview, :business_description, :job_description)
  end

end