class PunchesController < ApplicationController

  before_action :get_web_address, only: [:punch]

  def punch
    if @web_address
      browser = Browser.new(request.user_agent)
      @punch = @web_address.punches.new({
                                            ip_address: request.remote_ip,
                                            http_referer: request.referer,
                                            request_object: request.inspect,
                                            user_agent: browser.ua,
                                            browser: browser.name,
                                            platform: browser.platform,
                                            user_agent_metadata: browser.meta
                                        })

      redirect_to(@web_address.url) if @punch.save
    else
      redirect_to root_url, notice: 'Requested url Not found.'
    end
  end

  private

  def get_web_address
    @web_address = WebAddress.where(tiny_url: params[:token]).take
  end

end
