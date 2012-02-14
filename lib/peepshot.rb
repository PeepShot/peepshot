module PeepShot
  class NotConfigured < Exception; end
  class << self
    attr_accessor :api_key, :api_secret
  end
  
  def self.api_key
    @api_key || raise_unconfigured_exception
  end

  def self.api_secret
    @api_secret || raise_unconfigured_exception    
  end
  
  def self.raise_unconfigured_exception
    raise NotConfigured.new("No configuration provided for PeepShot. Either set the api_key and api_secret or call PeepShot.load_peepshot_yaml in an initializer")
  end
  
  def self.configuration=(hash)
    self.api_key = hash[:api_key]
    self.api_secret = hash[:api_secret]
  end
  
  def self.load_peepshot_yaml
    config = (YAML.load(ERB.new(File.read(File.join(::Rails.root,"config","peepshot.yml"))).result)[::Rails.env])
    raise NotConfigured.new("Unable to load configuration for #{::Rails.env} from peepshot.yml. Is it set up?") if config.nil?
    self.configuration = config.with_indifferent_access
  end
end

require "peepshot/rails/helpers/image_tags"
require "peepshot/rails/helpers"
require "peepshot/rails"

ActionView::Base.send :include, PeepShot::Rails::Helpers if defined? ActionView