*** Settings ***
Documentation  This suite tests a declined payment method on https://www.ryanair.com/ie/en
Resource       ../Resources/ryanair_resources.resource
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
Test Case 01 - Search a flight and login
    [Documentation]  This test verifies if the program does correctly login on the Ryanair
    ...              using the method login "facebook" and then search a flight with the following
    ...              options: "12/02/2022" "19/02/2022" "Athens"   
    Given the user can login on google
    Given the user can Acess the ryanair homepage site
    Should the website loaded and see if the title is "Official Ryanair website | Cheap flights from Ireland | Ryanair"
    Then user can login
    Should the user be loged in
    Then the user can select a destination
    Should the user can select a date
    Then select the quantity of passengers and search
    Given the user is on the flight page Should the user can select one flight
    Then the user can choose a fare
    And the user can put the names of passengers
    Should the user can select an family seating
    Then Then the user can select a type of bags
    And should select all flight extras
    Given the user selected all extras can plan a trip
    Should the user put the payment method
    Then the transaction has to not be completed

