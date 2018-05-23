class WebAddressesController < ApplicationController

  def generate
  end

  def short_address

  end

  private

  def web_address_params
    params.require(:web_address).permit(:url)
  end
end
