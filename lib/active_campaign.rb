# frozen_string_literal: true

require_relative "active_campaign/version"
require_relative 'active_campaign/json_formatter'
require_relative 'active_campaign/actions/contacts'
require_relative 'active_campaign/actions/fields'
require_relative 'active_campaign/actions/lists'


require 'httparty'
require 'json'
require 'logger'

# include our custom formatter with pretty json
HTTParty::Logger.add_formatter('json', HTTParty::Logger::JsonFormatter)

module ActiveCampaign
  class Error < StandardError; end
  
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end

  class Configuration
    attr_accessor :url
    attr_accessor :key

    def initialize
      @url = ENV['AC_URL']
      @key = ENV['AC_KEY'] 
    end
  end

  class Client
    include HTTParty
    include Actions::Contacts
    include Actions::Fields
    include Actions::Lists

    #logger ::Logger.new('log/active_campaign.log'), :debug, :json

    def initialize
      @url = ActiveCampaign.configuration.url
      @key = ActiveCampaign.configuration.key

      self.class.base_uri(@url + "/api/3")

      @headers = {
        'Api-Token' => "#{@key.delete('"')}",
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    end

    private

    def parse_response(response)
      response.parsed_response
    end
  end

end
