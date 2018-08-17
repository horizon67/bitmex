module Bitmex
  module HTTP
    module Private
      class Client

        def initialize(key, secret)
          @connection = Connection.new(key, secret)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Execution/Execution_get
        def execution(options = {})
          @connection.get('/api/v1/execution', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Execution/Execution_getTradeHistory
        def execution_trade_history(options = {})
          @connection.get('/api/v1/execution/tradeHistory', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Leaderboard/Leaderboard_getName
        def leaderboard_name
          @connection.get('/api/v1/leaderboard/name').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_getOrders
        def order(options = {})
          @connection.get('/api/v1/order', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_new
        def create_order(symbol, order_qty, options = {})
          @connection.post('/api/v1/order', { symbol: symbol, orderQty: order_qty }.merge(options)).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_cancel
        def cancel_order(id, cid)
          @connection.delete('/api/v1/order', {orderID: id, clOrdID: cid }).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_cancelAll
        def cancel_all_order
          @connection.delete('/api/v1/order/all').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Position/Position_get
        def position(options = {})
          @connection.get('/api/v1/position', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Order/Order_closePosition
        def close_position(symbol, price = nil)
          options = {
            symbol: symbol,
            price: price
          }.delete_if { |_, v| v.nil? }
          @connection.post('/api/v1/order/closePosition', options).body
        end
         
        # @see https://www.bitmex.com/api/explorer/#!/Trade/Trade_getBucketed
        def trade_bucketed(bin_size = '1m', options = {})
          @connection.get('/api/v1/trade/bucketed', { binSize: bin_size }.merge(options)).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/User/User_get
        def user
          @connection.get('/api/v1/user').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/User/User_getAffiliateStatus
        def user_affiliate_status
          @connection.get('/api/v1/user/affiliateStatus').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/User/User_getWallet
        def user_wallet(currency = 'XBt')
          @connection.get('/api/v1/user/wallet', { currency: currency }).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/User/User_getWalletHistory
        def user_wallet_history(currency = 'XBt')
          @connection.get('/api/v1/user/walletHistory', { currency: currency }).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/User/User_getWalletSummary
        def user_wallet_summary(currency = 'XBt')
          @connection.get('/api/v1/user/walletSummary', { currency: currency }).body
        end
      end
    end
  end
end
