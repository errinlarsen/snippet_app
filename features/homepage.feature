Feature: Homepage
  As a programmer that uses the Snippets site
  I want a friendly and useful homepage
  So that I can quickly view previous or save new snippets of code

  Background:
    Given the following snippets:
      | text |

  Scenario: Programmer visits home page
    When I am on the home page
    Then I should see "Welcome to Snippets!"
    And I should see a sidebar with previously saved snippets
    And I should see a form that allows me to to paste and save my snippet

  Scenario Outline: Programmer saves a valid snippet

  Examples:
    | name | type | description | tags |

  Scenario: Programmer saves an invalid snippet

  Examples:
    | name | type | description | tags |

  Scenario: Programmer views a previously saved snippet
