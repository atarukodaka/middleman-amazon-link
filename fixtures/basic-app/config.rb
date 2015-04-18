activate :amazon_link do |amazon|
  amazon.associate_tag = ENV['ASSOCIATE_TAG']
  amazon.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  amazon.aws_secret_key = ENV['AWS_SECRET_KEY']

  amazon.country = "jp"
  amazon.use_cache = true
  amazon.cache_dir = ".cache/amazon"  
end

