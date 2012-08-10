module Sprockets
  module Assistant
    class Compass
      require 'compass'

      ::Compass.configuration do |c|
        c.images_path = 'assets/images'
      end
    end
  end
end

