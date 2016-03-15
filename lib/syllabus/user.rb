require 'syllabus/client'

module Syllabus
  class User
  
    attr_reader :id, :name, :nickname, :image, :email, :created_at, :updated_at

    def initialize(options={})
      @id = options["id"]
      @name = options["name"]
      @nickname = options["nickname"]
      @image = options["image"]
      @email = options["email"]
      @created_at = options["created_at"]
      @updated_at = options["updated_at"]
    end

  end
end