@javascript
Feature: User can view the full article
    As a visitor,
    In order to read the full article,
    I would like to be able to access the article page.

    Background:
        Given the date is "2018-08-18"
        Given the following article exist
        | title          | body                                                             | 
        | This is so sad | A recent report suggest that news are mostly sad. Which is sad.  |
        | This is so fun | A recent report suggest that news are mostly fun. Which is fun.  |

        And the following user exists
        | email             | role       |
        | pablo@test.com    | basic_user |
        | pablo2@test.com   | subscriber |

    Scenario: Pablo can NOT see article page
        When I am logged in as 'pablo@test.com'
        And I am on the 'landing' page
        And I click on "This is so sad"
        Then I should see 'Access denied'
        Then I should be redirected to the 'landing' page

    Scenario: Pablo2 CAN see article page
        When I am logged in as 'pablo2@test.com'
        And I am on the 'landing' page
        And I click on "This is so sad"
        Then I should be on the show page for 'This is so sad'
        And I should see "This is so sad"
        And I should see "A recent report suggest that news are mostly sad. Which is sad"
        And I should see "Published on: 2018-08-18"
