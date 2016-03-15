require 'syllabus/client_auth'
require 'syllabus/client_orders'
module Syllabus
  class Client
    DEFAULT_CONNECTION_MIDDLEWARE = [
      Faraday::Request::Multipart,
      Faraday::Request::UrlEncoded,
      FaradayMiddleware::ParseJson
    ]

    include Syllabus::ClientAuth
    include Syllabus::ClientOrders

    FIELDS = [ :user_email, :user_token ]
    attr_accessor(*FIELDS)

    def initialize(options={})
      @user_email = options[:user_email]
      @user_token = options[:user_token]

      @connection_middleware = options[:connection_middleware] || []
      @connection_middleware += DEFAULT_CONNECTION_MIDDLEWARE
    end

    # Base URL for api requests
    def api_url
      "https://fast-bayou-75985.herokuapp.com/"
    end

    def connection
      params = {}
      params[:user_email] = @user_email if @user_email
      params[:user_token] = @user_token if @user_token
      @connection ||= Faraday::Connection.new(:url => api_url, :params => params, :headers => default_headers) do |builder|
        @connection_middleware.each do |middleware|
          builder.use *middleware
        end
        builder.adapter Faraday.default_adapter
      end
    end

    def return_error_or_body(response, response_body)
      if response.status == 200 || response.status == 201
        return response_body
      elsif response.status == 204
        return response.status
      else
        raise Syllabus::APIError.new(response)
      end
    end

    private

      def default_headers
        {
          :accept => 'application/json',
          :content_type => 'application/json',
          :user_agent => 'Ruby gem'
        }
      end

  end
end