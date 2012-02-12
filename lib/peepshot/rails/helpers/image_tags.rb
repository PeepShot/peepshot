module PeepShot
  module Rails
    module Helpers
      module ImageTags        
        def peepshot_image_tag(url, options)
          width = get_width.to_s.downcase == 'original' ? 1024 : get_width
          height = get_height
          image_tag(peepshot_url(url, options), :width => width, :height => height)
        end
      end
    end
  end
end