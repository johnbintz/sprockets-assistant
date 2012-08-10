require 'sprockets'
require 'sprockets-vendor_gems/extend_all'
require 'pathname'
require 'sprockets/assistant/output'

module Sprockets
  module Assistant
    class Compiler
      include Sprockets::Assistant::Output

      DEFAULT_TARGET = "compiled"

      def initialize(settings)
        @settings = settings
        @target = DEFAULT_TARGET
      end

      def compile
        @env = Sprockets::Environment.new
        @env.append_path('assets/javascripts')
        @env.append_path('assets/stylesheets')

        instance_eval(&@settings)
      end

      def file(name)
        file_target = target.join(name)
        say "#{name} => #{file_target}"

        file_target.parent.mkpath
        target.join(name).open('w') { |fh| fh.print @env[name].to_s }
      end

      def target
        Pathname(@target)
      end
    end
  end
end

