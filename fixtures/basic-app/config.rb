activate :amazon_link do |amazon|
  amazon.aws_access_key_id ="AKIAJUDCZXLDLISYWRHQ"
  amazon.aws_secret_key = ENV['AWS_SECRET_KEY']

  amazon.country = "jp"
  amazon.use_cache = false
  amazon.cache_dir = ".cache/amazon"  
end

