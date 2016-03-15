module Syllabus
  module ClientOrders

    # Add an order
    def add_order(number, total, total_quantity, email, options={})
      params = {"order" => {"number" => number, "total" => total, "total_quantity" => total_quantity, "email" => email}}
      options.map {|key, val| params["order"][key] = val }
      response = connection.post do |req|
        req.url "api/orders.json", params
      end
      Syllabus::Order.new(return_error_or_body(response, response.body).to_hash)
    end

    # Get orders
    def get_orders(options={})
      response = connection.get do |req|
        req.url "api/orders.json", options
      end
      return_error_or_body(response, response.body).map{|o| Syllabus::Order.new(o.to_hash)}.to_a
    end

    # Delete an order
    def delete_order(order_id, options={})
      response = connection.delete do |req|
        req.url "api/orders/#{order_id}.json", options
      end
      return_error_or_body(response, response.body)
    end
  end
end