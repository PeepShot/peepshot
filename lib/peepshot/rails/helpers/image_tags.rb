module PeepShot
  module Rails
    module Helpers
      module ImageTags        
        def peepshot_image_tag(url, options)
          width = find_width(options).to_s.downcase == 'original' ? 1024 : find_width(options)
          height = find_height(options)
          image_tag(peepshot_url(url, options), {:width => width, :height => height}.merge(options.except(:width, :height)))
        end
      end
    end
  end
end