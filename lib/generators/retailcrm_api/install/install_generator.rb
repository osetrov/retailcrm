# frozen_string_literal: true
#
module RetailcrmApi
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def generate_install
      copy_file 'retailcrm_api.yml', 'config/retailcrm_api.yml'
      copy_file 'retailcrm_api.rb', 'config/initializers/retailcrm_api.rb'
    end
  end
end

