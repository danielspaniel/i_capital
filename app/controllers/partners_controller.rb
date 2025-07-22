class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def show
  end
end
