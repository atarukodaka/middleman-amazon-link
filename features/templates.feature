Feature: setting template
  Scenario: title only
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      activate :amazon_link do |amazon|
        amazon.associate_tag = ENV['ASSOCIATE_TAG']
        amazon.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
        amazon.aws_secret_key = ENV['AWS_SECRET_KEY']
        
        amazon.country = "jp"
        amazon.use_cache = true
        amazon.cache_dir = ".cache/amazon"  
        amazon.register_templates = {simple: "%{asin}", foo: "bar"}
      end
      """
    And a file named "source/index.html.erb" with:
      """
      ---
      title: top
      ---
      <%= amazon("B0006BLI1I", :simple) %>
      """
    And the Server is running at "basic-app"
    When I go to "index.html"
    Then I should see "B0006BLI1I"
