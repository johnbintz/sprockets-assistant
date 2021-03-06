require 'rack'
require 'thor'
require 'bundler'

module Sprockets
  module Assistant
    class CLI < Thor
      include Thor::Actions
      source_root File.expand_path('../../../..', __FILE__)

      desc "server", "server"
      method_options %w{port -p} => 8080
      def server
        require 'sprockets/assistant/server'

        $stdout.sync = true

        Rack::Handler.default.run(Sprockets::Assistant::Server.app, :Port => options[:port])
      end

      desc "compile", "compile things"
      def compile
        require 'sprockets/assistant/app_builder'

        Sprockets::Assistant::AppBuilder.new.compile
      end

      desc "create NAME", "initialize a new assistant project"
      def create(name)
        directory 'skel', name

        Dir.chdir(name) do
          Bundler.with_clean_env { system %{bundle} }
        end
      end

      default_task :server
    end
  end
end
