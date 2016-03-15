require 'helper'

describe Syllabus::ClientOrders do

  describe "when creating an order" do
    # Passes
    # it "returns an order object as a hash if params are valid" do
    #   client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
    #   order = client.add_order(2, 3.00, 3, "dev-8@example.com", {"special_instructions" => "special instructions foo bar"})
    #   assert_equal "Syllabus::Order", order.class.name
    #   assert_equal "dev-8@example.com", order.email
    # end

    it "returns an error if params aren't valid" do
      client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      assert_raises(Syllabus::APIError) do
        client.add_order(nil, nil, nil, nil, {})
      end
    end
  end

  describe "when retrieving orders" do
    it "returns an array of hashes of the current users existing orders" do
      client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      orders = client.get_orders
      assert_equal "Array", orders.class.name
      assert_equal "Syllabus::Order", orders.first.class.name
      assert_equal "dev-8@example.com", orders.first.email
    end

    it "returns an error if there is no current user" do
      client = Syllabus::Client.new(:user_email => 'dev-6@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      assert_raises(Syllabus::APIError) do
        client.add_order(nil, nil, nil, nil, {})
      end
    end
  end

  describe "deleting an order" do
    # Passes
    # it "deletes the current user's order that matches the provided id" do
    #   client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
    #   assert_equal "204", client.delete_order(146, {})
    # end

    it "returns an error if the current user doesn't have an order matching the provided id" do
      client = Syllabus::Client.new(:user_email => 'dev-8@example.com', :user_token => 'qC3v3HvBfKxCQuyqu49g')
      assert_raises(Syllabus::APIError) do
        client.delete_order(144, {})
      end
    end

  end

end