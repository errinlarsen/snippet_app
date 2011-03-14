Feature: Homepage
  As a programmer that uses the Snippets site
  I want a friendly and useful homepage
  So that I can quickly view previous, or save new, snippets of code

  Background:
    Given a snippet of "Lua" code named "Lua snippet"
      """
      local position = {x=100, y=100, z=7}
      
      function onUse(cid, item, fromPosition)
        doSendMagicEffect(fromPosition, 12)
        doTeleportThing(cid, position)
        doSendMagicEffect(position, 12)
        return true
      end
      """
    And a snippet of "C" code named "C snippet"
      """
      #include<stdio.h>
      Int main(void)
      {
        Int a = 14;
        Int b = 73;
        Subtr = 73 – 14;
          Printf(“Tirando %i de %i resulta em %i\n”,a,b,subtr);
          Return 0;
      }
      """
      
  Scenario: User visits home page
    When I am on the home page
    Then I should see "Snippets" within "div#header h1"
    And I should see a form that allows me to to paste and save my snippet

  Scenario: Programmer views a previously saved snippet

  Scenario Outline: Programmer saves a valid snippet

  Examples:
    | name | type | description | tags |


  Scenario Outline: Programmer saves an invalid snippet

  Examples:
    | name | type | description | tags |
