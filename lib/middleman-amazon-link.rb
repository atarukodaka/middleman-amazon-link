require "middleman-amazon-link/version"

::Middleman::Extensions.register(:amazon_link) do
  require 'middleman-amazon-link/extension'
  ::Middleman::AmazonLink::Extension
end
