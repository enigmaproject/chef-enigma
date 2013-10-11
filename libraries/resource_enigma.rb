require 'chef/resource'

class Chef
  class Resource
    class Enigma < Chef::Resource

      def initialize(name, run_context=nil)
        super
        @resource_name = :enigma
        @provider = Chef::Provider::Enigma
        @action = :register
        @allowed_actions = [:register]

        @entity = name
      end

      def entity(arg=nil)
        set_or_return(:service,
                      arg,
                      :kind_of => String,
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

      def options(arg=nil)
        set_or_return(:options, arg, :kind_of => Hash, :default => {})
      end
    end
  end
end
