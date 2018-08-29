@javascript
Feature: Location based edition

    Feature Description


    Background:
        Given the following user exist
            | email          | password    | location  |
            | juan@test.com  | my-password | Kiruna    |
            | pablo@test.com | my-password | Stockholm |

    Scenario: Pablo sees the Stockholm edition
        Given I am logged in as "pablo@test.com"
        Given I am on the "landing" page
        Then I should see "You are viewing the Stockholm Edition"

    Scenario: Juan sees the Sweden edition
        Given I am logged in as "juan@test.com"
        Given I am on the "landing" page
        Then I should see "You are viewing the Sweden Edition"

    Scenario: Anonymous Visitor is also presented with a editopn based on his location
        Given I visit the site from "Stockholm"
        Then I should see "You are viewing the Stockholm Edition"

    Scenario: Erik is also presented with a editon based on his location
        Given I visit the site from "Täby"
        Then I should see "You are viewing the Stockholm Edition"

    Scenario: Thomas' mother is also presented with Sweden edition
        Given I am on the 'landing' page
        Then I should see "You are viewing the Sweden Edition"
