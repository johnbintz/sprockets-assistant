require 'sprockets'
require 'sprockets-vendor_gems/extend_all'
require 'pathname'
require 'sprockets/assistant/output'
require 'sprockets-sass'
require 'sprockets/assistant/compass'
require 'yui/compressor'

module Sprockets
  module Assistant
    class Compiler
      include Sprockets::Assistant::Output

      DEFAULT_TARGET = "compiled"

      def initialize(settings)
        @settings = settings
        @target = DEFAULT_TARGET
      end

      def compile(paths)
        ::Compass.configuration do |c|
          c.output_style = :compressed
        end

        @env = Sprockets::Environment.new
        @env.append_path('assets/javascripts')
        @env.append_path('assets/stylesheets')

        paths.each { |path| @env.append_path(path) }

        instance_eval(&@settings)
      end

      def file(name)
        file_target = target.join(name)
        say "#{name} => #{file_target}"

        js_compressor = YUI::JavaScriptCompressor.new(:munge => true)

        file_target.parent.mkpath
        target.join(name).open('w') { |fh|
          output = @env[name].to_s

          if File.extname(name) == '.js'
            output = js_compressor.compress(output)
          end

          fh.print output
        }
      end

      def target
        Pathname(@target)
      end
    end
  end
end

