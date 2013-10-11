require 'chef/provider'

class Chef
  class Provider
    class Enigma < Chef::Provider
      def initialize(*args)
        super
        require 'frosty'

        @connection = connection
        @connection.environment = new_resource.environment
      end

      def load_current_resource
        @current_resource ||= Chef::Resource::Enigma.new(new_resource.entity)
        @current_resource.entity(new_resource.entity)
        @current_resource
      end

      def connection
        conn = nil
        new_resource.etcdhosts.each do |host|
          frosty = Frosty.new(host, new_resource.etcdport || 4001)
          if frosty.can_connect?
            conn = frosty
            break
          end
        end

        if conn.nil?
          Chef::Log.error("Unable to connect to etcd")
        else
          conn
        end
      end
    end
  end
end
