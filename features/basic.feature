Feature: basic
  Scenario: amazon
    Given a fixture app "basic-app"
    And the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see:
      """
      <a href="http://www.amazon.co.jp/Kalita-%E3%82%AB%E3%83%AA%E3%82%BF-%E3%83%9F%E3%83%8B%E3%83%9F%E3%83%AB/dp/B0006BLI1I%3FSubscriptionId%3DAKIAJUDCZXLDLISYWRHQ%26tag%3Dmyhoney0079-22%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB0006BLI1I" target="_blank"><img src="http://ecx.images-amazon.com/images/I/41Q9QV8A60L._SL160_.jpg">
      """
    
