require 'retailcrm-api'

RetailcrmApi.setup do |config|
  if File.exist?('config/retailcrm_api.yml')
    processed = YAML.load_file('config/retailcrm_api.yml')[Rails.env]

    processed.each do |k, v|
      config::register k.underscore.to_sym, v
    end

    config::Request.api_key ||= ENV['RETAILCRM_API_KEY']
    config::Request.timeout = 60
    config::Request.open_timeout = 60
    config::Request.symbolize_keys = true
    config::Request.debug = false
  end
end