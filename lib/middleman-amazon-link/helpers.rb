require 'middleman-amazon-link/ecs_wrapper'

module Middleman
  module AmazonLink
    module Helpers
      @@templates = {
        title: %Q{<span><a href="%{title}" target="_blank">%{title}</a></span>},
        detail:
        %(
<div class="amazon_item">
  <a href="%{detail_url}" target="_blank"><img src="%{image_medium}"></a>
  <a href="%{detail_url}" target="_blank">%{title}</a><br/>
  <div class="item_detail">
    %{author} / %{publisher} / %{date}
  </div>
</div>)
      }
      def amazon(asin, type_or_string = :detail)
        amazon_opts = amazon_link_settings
        ecs_opt = {
          associate_tag: amazon_opts.associate_tag,
          AWS_access_key_id: amazon_opts.aws_access_key_id,
          AWS_secret_key: amazon_opts.aws_secret_key,
          country: amazon_opts.country,
        }
        opt = {
          use_cache: amazon_opts.use_cache,
          cache_dir: amazon_opts.cache_dir
        }
        #binding.pry
        amazon_lookup = Middleman::AmazonLink::EcsLookupWrapper.new(ecs_opt, opt)
        hash =  amazon_lookup.item_lookup(asin) || {}
        
        if block_given?
          yield(hash)
        else
          template = (type_or_string.class == Symbol) ? @@templates[type_or_string] : type_or_string
          #or raise "no such template type: '#{type}'"
          template % hash
        end
      end
    end
  end
end
