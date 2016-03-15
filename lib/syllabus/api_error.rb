module Syllabus
  class APIError < StandardError

    attr_reader :code, :detail, :type, :response

    def initialize(response)
      @code   = response.status
      @detail = response.body
      @response = response
    end

    def message
      "#{@type}: #{@detail} (#{@code})"
    end
    alias :to_s :message
  end
end