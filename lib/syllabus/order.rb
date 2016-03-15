require 'syllabus/client'

module Syllabus
  class Order

    attr_reader :id, :number, :total, :total_quantity, :email, :special_instructions, :created_at, :updated_at

    def initialize(options={})
      @id = options["id"]
      @number = options["number"]
      @total = options["total"]
      @total_quantity = options["total_quantity"]
      @email = options["email"]
      @special_instructions = options["special_instructions"]
      @created_at = options["created_at"]
      @updated_at = options["updated_at"]
    end

  end
end