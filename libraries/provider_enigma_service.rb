require File.join(File.dirname(__FILE__), 'provider_enigma')

class Chef
  class Provider
    class EnigmaService < Chef::Provider::Enigma

      def initialize(*args)
        super
        @service = service
      end

      def load_current_resource
        @current_resource ||= Chef::Resource::EnigmaService.new(new_resource.name)
        @current_resource.service(new_resource.name)
        @current_resource
      end

      def action_register
        if @service.exists? and @service.endpoints.include?(new_resource.ip)
          new_resource.updated_by_last_action false
        else
          @endpoint = service.endpoint(new_resource.ip)
          @endpoint.role = new_resource.role unless new_resource.role.nil?
          @endpoint.port = new_resource.port
          @service.save_endpoint(@endpoint)
          @node.add_service(new_resource.name)
          @node.save
          new_resource.updated_by_last_action true
        end
      end

      def service
        @connection.service(new_resource.name)
      end
    end
  end
end
