module Sprockets
  module Assistant
    module Output
      def say(*args)
        $stdout.puts(*args)
      end
    end
  end
end

