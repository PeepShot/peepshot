require 'uri'
require 'cgi'
require 'digest'

module PeepShot
  module Rails
    module Helpers
      class InvalidDimensions < Exception; end
      include ImageTags
      
      def peepshot_url(url, options)
        options = {:width => 200, 
                   :height => nil
                   }.merge(options)

        host       = 'api.peepshot.com'
        token      = Digest::MD5.hexdigest(PeepShot.api_secret + url)
        dimensions = build_dimensions_string(options)
        
        URI.escape("http://#{host}/v1/#{PeepShot.api_key}/#{token}/#{dimensions}?url=#{url}")
      end

      def build_dimensions_string(options)
        width = find_width(options)
        height = find_height(options)

        dimensions_string = height ? "#{width}x#{height}" : "#{width}"
        /[\dx]+|original/i =~ dimensions_string ? dimensions_string : raise_invalid_dimensions
      end

      def find_width(options)
        if options[:width].to_s.downcase == 'original'
          'original'
        elsif options[:width].to_i < 10
          raise_invalid_dimensions
        elsif options[:width].to_i > 1024
          raise_invalid_dimensions
        else
          options[:width].to_i
        end
      end
      
      def find_height(options)
        if options[:height] && options[:height].to_i > 10 && options[:height].to_i < 2000
          options[:height].to_i
        else
          nil
        end
      end

      def raise_invalid_dimensions
        raise InvalidDimensions.new("The dimensions you provided was not valid. The width must be a number between 10 and 1024 or the string 'original'. Height must be a number.")
      end
    end
  end
end