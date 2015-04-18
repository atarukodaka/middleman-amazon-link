require 'amazon/ecs'
        
module Middleman
  module AmazonLink
    class EcsLookupWrapper
      def initialize(ecs_opt, opt={})
        ecs_opt[:country] ||= 'jp'
        ecs_opt[:response_group] = 'Images,ItemAttributes'

        Amazon::Ecs.options= ecs_opt
        # required
        #   :AWS_access_key_id
        #   :AWS_secret_key
        # optional
        #   :associate_tag
        #   :country

        @use_cache = opt[:use_cache]
        @cache_dir = opt[:cache_dir] || "./caches/amazon"

        @result_cache = {}
      end
      def item_lookup(asin)
        return @result_cache[asin] if @result_cache.has_key?(asin)
        return @result_cache[asin] = load_cache(asin) if @use_cache && File.exist?(cache_filename(asin))

        cnt = 0
        begin
          res = Amazon::Ecs.item_lookup(asin)
        rescue Amazon::RequestError => err
          if /503/ =~ err.message && cnt < 3
            sleep 3
            cnt += 1
            $stderr.puts "  retrying...#{asin}/#{cnt}"
            $stderr.puts "    options: #{Amazon::Ecs.options.inspect}"
            retry
          else
            raise err
          end
        end

        res.items.each do |item|
          hash = {
            asin:        asin,
            title:       item.get('ItemAttributes/Title').to_s,
            author:      item.get('ItemAttributes/Author').to_s,
            publisher:   item.get('ItemAttributes/Manufacturer').to_s,
            date:        item.get('ItemAttributes/PublicationDate').to_s || 
                         item.get('ItemAttributes/ReleaseDate').to_s,
            detail_url:  item.get('DetailPageURL').to_s,

            image_small: item.get('SmallImage/URL').to_s,
            image_medium: item.get('MediumImage/URL').to_s,
            image_large: item.get('LargeImage/URL').to_s,
          }
          @result_cache[asin] = hash
          save_cache(asin, hash) if @use_cache
        end
        return @result_cache[asin]
      end
      ################
      # caching
      def cache_filename(asin)
        File.join(@cache_dir, asin)
      end
      def load_cache(asin)
        Marshal.load(File.read(cache_filename(asin)))
      end
      def save_cache(asin, hash)
        dir = File.dirname(cache_filename(asin))
        require 'fileutils'
        FileUtils.mkdir_p(dir) unless File.exists?(dir)
        File.open(cache_filename(asin), 'wb'){|f| f.write(Marshal.dump(hash))}
      end
    end
  end  ## class
end
