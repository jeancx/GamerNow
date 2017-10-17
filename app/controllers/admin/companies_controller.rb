class Admin::CompaniesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  layout "administration"

  # GET /admin/companies
  # GET /admin/companies.json
  def index
    @companies = Company.paginate(:page => params[:page], :per_page => 10).order('id DESC').accessible_by(current_ability)
  end

  # GET /admin/companies/1
  # GET /admin/companies/1.json
  def show
  end

  # GET /admin/companies/new
  def new
    @company = Company.new
  end

  # GET /admin/companies/1/edit
  def edit
  end

  # POST /admin/companies
  # POST /admin/companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to [:admin, @company], notice: 'Company was successfully created.' }
        format.json { render action: 'show', status: :created, location: @company }
      else
        format.html { render action: 'new' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/companies/1
  # PATCH/PUT /admin/companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to [:admin, @company], notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/companies/1
  # DELETE /admin/companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to admin_companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.where(id: params[:id]).accessible_by(current_ability).take
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:title, :logo, :description)
    end

end
