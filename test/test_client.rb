require 'helper'

describe Syllabus::Client do


  describe "when creating a client instance" do
    
    it "uses the correct base url for api requests" do
      client = Syllabus::Client.new
      assert_equal "https://fast-bayou-75985.herokuapp.com/", client.api_url
    end

    it "uses assigned user email/token" do
      client = Syllabus::Client.new({
        :user_email  => "foo",
        :user_token  => "bar"
      })
      assert_equal "foo", client.user_email
      assert_equal "bar", client.user_token
    end

  end

end