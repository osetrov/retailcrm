require 'retailcrm-api/version'
require 'retailcrm-api/retailcrm_error'
require 'retailcrm-api/retailcrm_api_error'
require 'retailcrm-api/request'
require 'retailcrm-api/api_request'
require 'retailcrm-api/response'

module RetailcrmApi
  class << self
    def setup
      yield self
    end

    def register(name, value, type = nil)
      cattr_accessor "#{name}_setting".to_sym

      add_reader(name)
      add_writer(name, type)
      send "#{name}=", value
    end

    def add_reader(name)
      define_singleton_method(name) do |*args|
        send("#{name}_setting").value(*args)
      end
    end

    def add_writer(name, type)
      define_singleton_method("#{name}=") do |value|
        send("#{name}_setting=", DynamicSetting.build(value, type))
      end
    end
  end

  class DynamicSetting
    def self.build(setting, type)
      (type ? klass(type) : self).new(setting)
    end

    def self.klass(type)
      klass = "#{type.to_s.camelcase}Setting"
      raise ArgumentError, "Unknown type: #{type}" unless RetailcrmApi.const_defined?(klass)
      RetailcrmApi.const_get(klass)
    end

    def initialize(setting)
      @setting = setting
    end

    def value(*_args)
      @setting
    end
  end
end
