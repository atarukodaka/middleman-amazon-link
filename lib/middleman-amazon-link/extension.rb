require 'middleman-amazon-link/helpers'

module Middleman
  module AmazonLink
    class Extension < Middleman::Extension
      option :aws_access_key_id, nil, 'AWS Access Key ID'
      option :aws_secret_key, nil, 'AWS Secret key'
      option :associate_tag, nil, 'tag: xxx-22'
      option :country, 'jp', 'country'

      option :use_cache, true, 'use cache or not'
      option :cache_dir, './caches/amazon', 'directory for caches'

      option :register_templates, {}
      
      def initialize(app, options_hash = {}, &block)
        super
        app.set :amazon_link_settings, options

        options.register_templates.each do |type, template|
          Middleman::AmazonLink::Helpers.register_template(type, template)
        end
      end
      helpers do
        include Middleman::AmazonLink::Helpers
      end
      def after_configuration
      end
    end
  end
end


