require 'sprockets-vendor_gems/extend_all'
require 'sinatra/base'
require 'sinatra/sprockets'
require 'sprockets/assistant/compiler'

module Sprockets
  module Assistant
    class AppBuilder
      ASSISTANT_CONFIG_FILE = Pathname('assistant_config.rb')

      def initialize
        instance_eval(ASSISTANT_CONFIG_FILE.read)
      end

      def app(&block)
        if block
          @app = block
        else
          _app = @app

          Class.new(Sinatra::Base) do
            set :root, Dir.pwd

            register Sinatra::Sprockets

            set :views, 'views'

            class_eval(&_app)
          end
        end
      end

      def middleware(&block)
        if block
          @middleware = block
        else
          @middleware
        end
      end

      def compile(&block)
        if block
          @compile = block
        else
          Compiler.new(@compile).compile
        end
      end
    end
  end
end

