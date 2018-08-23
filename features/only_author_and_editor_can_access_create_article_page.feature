@javascript
Feature: Assign Roles to different Users
    As a system owner,
    In order to differentiate between the Users,
    I would like to be able to apply different roles to Users.

    Background:
        Given the following users exist
        |email              |role       |
        |user@user.se       |basic_user |
        |subscriber@user.se |subscriber |
        |author@user.se     |author     |
        |editor@user.se     |editor     |

    Scenario: User tries to access Create Article page
        When I am logged in as 'user@user.se'
        And I am on the 'Create Article' page
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page

    Scenario: Subscriber tries to access Create Article page
        When I am logged in as 'subscriber@user.se'
        And I am on the 'Create Article' page
        Then I should see 'Access denied'
        And I should be redirected to the 'landing' page

    Scenario: Author tries to access Create Article page
        When I am logged in as 'author@user.se'
        And I am on the 'Landing' page
        And I click on 'New Article'
        Then I should be redirected to the 'Create Article' page

    Scenario: Editor tries to access Create Article page
        When I am logged in as 'editor@user.se'
        And I am on the 'Landing' page
        And I click on 'New Article'
        And I should be redirected to the 'Create Article' page