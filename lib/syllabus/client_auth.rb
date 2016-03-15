module Syllabus
  module ClientAuth

    # Sign in to an account
    def sign_in(email, password)
      params = {"user" => {"email" => email, "password" => password}}
      response = connection.post do |req|
        req.url "users/sign_in.json", params
      end
      Syllabus::User.new(return_error_or_body(response, response.body).to_hash)
    end

    # Sign up for an account
    def sign_up(email, password, password_confirmation)
      params = {"user" => {"email" => email, "password" => password, "password_confirmation" => password_confirmation}}
      response = connection.post do |req|
        req.url "/users.json", params
      end
      Syllabus::User.new(return_error_or_body(response, response.body).to_hash)
    end

    # Get the current user
    def current_user(options={})
      response = connection.get do |req|
        req.url "api/users/current_user/edit.json", options
      end
      Syllabus::User.new(return_error_or_body(response, response.body).to_hash)
    end
 
  end
end