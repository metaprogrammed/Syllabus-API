require 'helper'

describe Syllabus::ClientAuth do

  describe "when successful" do
    it "returns a Syllabus::User object" do
      client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      user = client.current_user
      assert_equal "Syllabus::User", user.class.name
      assert_equal "dev-8@example.com", user.email
    end
  end

  describe "when signing up a new user" do
    # Passes
    # it "signs up a user with a valid email/password" do
    #   client = Syllabus::Client.new({})
    #   user = client.sign_up("dev-14@example.com", "password", "password")
    #   assert_equal "Syllabus::User", user.class.name
    #   assert_equal "dev-14@example.com", user.email
    # end

    it "returns an error if sign up fails" do
      client = Syllabus::Client.new
      assert_raises(Syllabus::APIError) do
        client.sign_up("dev-8@example.com", "", "")
      end
    end

  end

  describe "when signing in an existing user" do
    it "signs in user if email/password are valid" do
      client = Syllabus::Client.new
      user = client.sign_in("dev-8@example.com", "password")
      assert_equal "Syllabus::User", user.class.name
      assert_equal "dev-8@example.com", user.email
    end

    it "returns an error if sign in fails" do
      client = Syllabus::Client.new
      assert_raises(Syllabus::APIError) do
        client.sign_in("dev-8@example.com", "")
      end
    end

  end

  describe "when client is configured with user email/token" do
    it "returns the current user that matches a valid email/token" do
      client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      user = client.current_user
      assert_equal "Syllabus::User", user.class.name
      assert_equal "dev-8@example.com", user.email
    end

    it "returns an error if there's no current user" do
      client = Syllabus::Client.new(:user_email => 'dev-6@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      assert_raises(Syllabus::APIError) do
        client.current_user
      end
    end

  end

end