Feature: Putting a dam in front of an app
  In order to deploy candidly
  As a developer/ninja
  I want to build a dam in front of my app

  Scenario: An damless app
    Given I visit the landing page of my app
    Then I can see my awesome beaverless app

  Scenario: Hitting the dam
    Given I have beavered my app
    When I visit the landing page of my app
    Then I should be presented with beaver's login screen
