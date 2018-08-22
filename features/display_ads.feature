Feature: Display ads on the landing page
    As an Editor,
    In order to increase the revenue,
    I would like to show advertising on the website. 

    Scenario: Display ads on the landing page
        When I am on the 'landing' page
        Then I should see the ad ".right_ad"
        