module Bitmex
  module HTTP
    module Private
      class Client

        def initialize(key, secret)
          @connection = Connection.new(key, secret)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_getOrders
        def orders(query = {})
          @connection.get('/api/v1/order', query).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_closePosition
        def cancel_order(id, cid)
          @connection.delete('/api/v1/order', {orderID: id, clOrdID: cid }).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_cancelAll
        def cancel_orders
          @connection.delete('/api/v1/order/all').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Position/Position_get
        def position(query = {})
          @connection.get('/api/v1/position', query).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_closePosition
        def close_position(symbol, options = {})
          body = {
            symbol: symbol,
            price: options[:price]
          }.delete_if { |_, v| v.nil? }
          @connection.post('/api/v1/order/closePosition', body).body
        end
         
        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_new
        def create_order(symbol, options = {})
          body = {
            symbol: symbol,
            side: options[:side],
            orderQty: options[:orderQty],
            price: options[:price],
            execInst: options[:execInst],
            ordType: options[:ordType]
          }.delete_if { |_, v| v.nil? }
          @connection.post('/api/v1/order', body).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Insurance/Insurance_get
        def insurance(query = {})
          @connection.get('/api/v1/insurance', query).body
        end
      end
    end
  end
end
