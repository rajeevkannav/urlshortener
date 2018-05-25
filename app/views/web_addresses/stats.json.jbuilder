if @web_address
  json.(@web_address, :url, :tiny_url, :created_at, :updated_at)
  json.punches @web_address.punches, :ip_address, :http_referer, :user_agent, :browser, :platform, :created_at, :updated_at
end