module Fog
  module Parsers
    module DNS
      module Slicehost

        class GetRecords < Fog::Parsers::Base

          def reset
            @record = {}
            @response = { 'records' => [] }
          end

          def end_element(name)
            case name
            when 'zone-id'
              @record["zone_id"] = value.to_i
            when 'record-type'
              @record["record_type"] = value
            when 'ttl'
              @record[name] = value.to_i
            when 'name', 'data', 'active', 'aux'
              @record[name] = value
            when 'record'
              @response['records'] << @record
              @record = {}
            end
          end

        end

      end
    end
  end
end
