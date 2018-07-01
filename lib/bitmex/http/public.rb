module Bitmex
  module HTTP
    module Public
      class Client

        def initialize
          @connection = Connection.new(nil, nil)
        end

        # @see https://www.bitmex.com/api/explorer/#!/Announcement/Announcement_get
        def announcement(query = {})
          @connection.get('/api/v1/announcement', query).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Announcement/Announcement_getUrgent
        def announcement_urgent(query = {})
          @connection.get('/api/v1/announcement/urgent', query).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Instrument/Instrument_get
        def instrument(query = {})
          @connection.get('/api/v1/instrument', query).body
        end

        # @see https://www.bitmex.com/api/explorer/#!/Instrument/Instrument_getActive
        def instrument_active(query = {})
          @connection.get('/api/v1/instrument/active').body
        end
      end
    end
  end
end
