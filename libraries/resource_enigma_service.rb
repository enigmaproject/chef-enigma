require 'chef/resource'

class Chef
  class Resource
    class EnigmaService < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @resource_name = :enigma_service
        @provider = Chef::Provider::EnigmaService
        @action = :discover
        @allowed_actions = [:discover, :register]

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

      def environment(arg=nil)
        set_or_return(:environment,
                      arg,
                      :kind_of => String,
                      :required => true)
      end

      def ip(arg=nil)
        set_or_return(:ip,
                      arg,
                      :kind_of => String,
                      :required => true)
      end

      def role(arg=nil)
        set_or_return(:role, arg, :kind_of => String)
      end

      def etcdhosts(arg=nil)
        set_or_return(:etcdhosts, arg, :kind_of => Array)
      end

      def etcdport(arg=nil)
        set_or_return(:etcdport, arg, :kind_of => [Fixnum, String])
      end
    end
  end
end
