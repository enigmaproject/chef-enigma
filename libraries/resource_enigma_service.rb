require File.join(File.dirname(__FILE__), 'resource_enigma')

class Chef
  class Resource
    class EnigmaService < Chef::Resource::Enigma

      def initialize(name, run_context=nil)
        super
        @resource_name = :enigma_service
        @provider = Chef::Provider::EnigmaService
        @action = :register
        @allowed_actions = [:register]

        @service = name
      end

      def service(arg=nil)
        set_or_return(:service,
                      arg,
                      :kind_of => String,
                      :required => true)
      end

      def port(arg=nil)
        set_or_return(:port,
                      arg,
                      :kind_of => [Fixnum, String],
                      :required => true)
      end
    end
  end
end
