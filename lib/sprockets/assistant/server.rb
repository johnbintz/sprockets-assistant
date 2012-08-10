require 'rack'

module Sprockets
  module Assistant
    class Server
      def self.app
        new.app
      end

      def initialize
        require 'sprockets/assistant/app_builder'
        require 'sprockets-sass'
        require 'sprockets/assistant/compass'

        @app_builder = AppBuilder.new
      end

      def call(env)
        app.call(env)
      end

      def app
        _app_builder = @app_builder
        _app = @app_builder.app

        Rack::Builder.app do
          use Rack::CommonLogger, $stdout

          instance_eval(&_app_builder.middleware)

          map "/#{Sinatra::Sprockets.config.prefix}" do
            run Sinatra::Sprockets.environment
          end

          run _app
        end
      end
    end
  end
end

