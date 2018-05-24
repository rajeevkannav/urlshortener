class WebAddressesController < ApplicationController

  before_action :set_web_address, only: [:generate]
  before_action :authenticate_user!, only: [:index]

  def index
    @web_addresses = current_user.web_addresses.includes(:punches)
  end

  def generate
    tries ||= 5
    begin
      @web_address.save
    rescue ActiveRecord::RecordNotUnique => e
      if (tries -= 1) >= 0
        logger.info "Retrying @ #{tries}"
        retry
      else
        logger.info "Oh Noes! #{e.inspect}"
      end
    end
  end

  private

  def set_web_address
    @web_address = current_user.nil? ?
                       WebAddress.find_or_initialize_by(url: web_address_params[:url]) :
                       current_user.web_addresses.find_or_initialize_by(url: web_address_params[:url])
  end

  def web_address_params
    params.require(:web_address).permit(:url)
  end
end
