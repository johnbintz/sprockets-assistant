require 'sprockets/assistant/server'
require 'rack'
require 'thor'

module Sprockets
  module Assistant
    class CLI < Thor
      include Thor::Actions
      source_root File.expand_path('../../../..', __FILE__)

      desc "server", "server"
      def server
        Rack::Handler.default.run(Sprockets::Assistant::Server.app)
      end

      desc "compile", "compile things"
      def compile
        Sprockets::Assistant::AppBuilder.new.compile
      end

      desc "create NAME", "initialize a new assistant project"
      def create(name)
        directory 'skel', name
      end
    end
  end
end
