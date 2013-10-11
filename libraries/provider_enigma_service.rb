require 'chef/provider'

class Chef
  class Provider
    class EnigmaService < Chef::Provider

      def initialize(*args)
        super
        require 'frosty'
        connect
        @frosty.environment = new_resource.environment
        @service = service
      end

      def load_current_resource
        @current_resource ||= Chef::Resource::EnigmaService.new(new_resource.name)
        @current_resource.service(new_resource.name)
        @current_resource
      end

      def action_discover
        ##TODO: Implement
      end

      def action_register
        if @service.exists? and @service.endpoints.include?(new_resource.ip)
          new_resource.updated_by_last_action false
        else
          @endpoint = service.endpoint(new_resource.ip)
          @endpoint.role = new_resource.role unless new_resource.role.nil?
          @endpoint.port = new_resource.port
          @service.save_endpoint(@endpoint)
          new_resource.updated_by_last_action true
        end
      end

      def service
        @frosty.service(new_resource.name)
      end

      def connect
        new_resource.etcdhosts.each do |host|
          @frosty = Frosty.new(host)
          if @frosty.can_connect?
            break
          end
        end
      end
    end
  end
end
