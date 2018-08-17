module Bitmex
  module HTTP
    module Public
      class Client

        def initialize
          @connection = Connection.new(nil, nil)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Announcement/Announcement_get
        def announcement(options = {})
          @connection.get('/api/v1/announcement', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Announcement/Announcement_getUrgent
        def announcement_urgent(options = {})
          @connection.get('/api/v1/announcement/urgent', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Funding/Funding_get
        def funding(options = {})
          @connection.get('/api/v1/funding', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Instrument/Instrument_get
        def instrument(options = {})
          @connection.get('/api/v1/instrument', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Instrument/Instrument_getActive
        def instrument_active
          @connection.get('/api/v1/instrument/active').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Insurance/Insurance_get
        def insurance(options = {})
          @connection.get('/api/v1/insurance', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Leaderboard/Leaderboard_get
        def leaderboard(options = {})
          @connection.get('/api/v1/leaderboard', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Liquidation/Liquidation_get
        def liquidation(options = {})
          @connection.get('/api/v1/liquidation', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/OrderBook/OrderBook_getL2
        def order_book_l2(symbol, depth = 25)
          @connection.get('/api/v1/orderBook/L2', { symbol: symbol, depth: depth }).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Settlement/Settlement_get
        def settlement(options = {})
          @connection.get('/api/v1/settlement', options).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Stats/Stats_get
        def stats
          @connection.get('/api/v1/stats').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Stats/Stats_history
        def stats_history
          @connection.get('/api/v1/stats/history').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Stats/Stats_historyUSD
        def stats_history_usd
          @connection.get('/api/v1/stats/historyUSD').body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Trade/Trade_get
        def trade(options = {})
          @connection.get('/api/v1/trade', options).body
        end
      end
    end
  end
end
