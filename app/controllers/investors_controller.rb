class InvestorsController < ApplicationController
  before_action :set_partner

  def index
    @investors = @partner.investors
  end

  def show
    @investor = @partner.investors.find(params[:id])
  end

  def new
    @investor = @partner.investors.build
    @investor.addresses.build
  end

  def create
    @investor = @partner.investors.build(investor_params)
    if @investor.save
      redirect_to new_partner_investor_path(@partner), notice: 'Investor was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_partner
    @partner = Partner.find(params[:partner_id])
  end

  def investor_params
    params.require(:investor).permit(:first_name, :last_name, :date_of_birth, :phone_number, :document, addresses_attributes: [:street, :state, :zip_code])
  end
end 