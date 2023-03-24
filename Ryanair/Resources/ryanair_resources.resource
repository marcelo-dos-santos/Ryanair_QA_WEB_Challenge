*** Settings ***
Library      SeleniumLibrary

*** Variables ***

${URL}                      https://www.ryanair.com/ie/en
${URL_GOOGLE}               https://www.google.com
${GOOGLE_LOGIN_BUTTON}      //html/body/div[1]/div[1]/div/div/div/div[2]/a
${COOKIE_BUTTON}            //button[@class='cookie-popup-with-overlay__button'][contains(.,'Yes, I agree')]
${FLIGHT_BUTTON}            //div[@class='tab-text ng-star-inserted'][contains(.,'flights')]
${LOGIN_EMAIL}              //input[contains(@name,'email')]
${LOGIN_BUTTON}             //span[@class='header-menu-item__title ng-star-inserted'][contains(.,'Log In')]
${lOGIN_PASSWORD}           //input[contains(@type,'password')] 
${lOGIN_CONFIRM}            //button[@color='flat-yellow'][contains(.,'Log in')]
${LOGIN_VERIFY}             //span[contains(.,'reynairtest@gmail.com')]   
${LOGIN_GOOGLE}             //button[@type='button'][contains(.,'Continue with Google')]
${EMAIL_GOOGLE}             //input[contains(@type,'email')]
${PASSWORD_GOOGLE}          //input[contains(@type,'password')] 
${FARE}                     //button[@class='fare-card__button fare-card__price ry-button--gradient-light-blue']
${CAR_HIRE}                 //div[@class='pillar-card__wrapper-content ng-tns-c124-14 ng-trigger ng-trigger-opacityAnimation']
${CARD_NUMBER}              5555 5555 5555 5557
${EXPIRE_DATE}              1025
${CVC}                      265
${COUNTRY}                  //div[@class='reactive-complete__option ng-star-inserted'][contains(.,'Brazil  Brazil')]  

*** Keywords ***
Abrir o navegador
  Open Browser    browser=chrome
  Maximize Browser Window

 Fechar o navegador
  Close Browser

Given the user can login on google
  Go To    url=${URL_GOOGLE}
  Click Element    locator=${GOOGLE_LOGIN_BUTTON}
  Wait Until Element Is Visible    locator=${EMAIL_GOOGLE}
  Click Element    locator=${EMAIL_GOOGLE}
  Input Text    locator=${EMAIL_GOOGLE}    text=reynairtest@gmail.com
  Click Element    locator=//span[@jsname='V67aGc'][contains(.,'Avançar')]
  Wait Until Element Is Visible    locator=${PASSWORD_GOOGLE}
  Click Element    locator=${PASSWORD_GOOGLE}
  Input Text    locator=${PASSWORD_GOOGLE}    text=reynairtest123
  Click Element    locator=//span[@jsname='V67aGc'][contains(.,'Avançar')]
    
Given the user can Acess the ryanair homepage site
  Wait Until Element Is Visible    locator=//img[contains(@class,'lnXdpd')]
  Go To    url=${URL}
  Wait Until Element Is Visible  locator=${COOKIE_BUTTON}
  Click Button    locator=${COOKIE_BUTTON}

Should the website loaded and see if the title is "${TITLE}"
  Wait Until Element Is Visible    locator=${FLIGHT_BUTTON}
  Title Should Be    title=${TITLE}

Then user can login
  Wait Until Element Is Visible    locator=${LOGIN_BUTTON}
  Click Element    locator=${LOGIN_BUTTON}
  Sleep    7s
  Wait Until Element Is Visible   locator=${LOGIN_GOOGLE}    timeout=20
  Click Button    locator=${LOGIN_GOOGLE}

Should the user be loged in 
  Wait Until Element Is Visible    locator=${FLIGHT_BUTTON}
  Wait Until Page Contains Element    locator=${LOGIN_VERIFY}

Then the user can select a destination
  Wait Until Element Is Visible    locator=//input[@type='text'][contains(@id,'destination')]
  Click Element  //input[@type='text'][contains(@id,'destination')]
  Sleep    5s
  Wait Until Page Contains Element    locator=//span[@data-ref='airport-item__name'][contains(.,'Athens')]    timeout=20
  Click Element    locator=//span[@data-ref='airport-item__name'][contains(.,'Athens')]

Should the user can select a date
  Wait Until Element Is Visible    locator=//span[@class='tab-text'][contains(.,'Exact dates')]
  Sleep    3s
  Click Element    locator=//div[@class='calendar-body__cell'][contains(.,'18')]
  Sleep    3s
  Wait Until Element Is Visible    locator=//div[@class='calendar-body__cell'][contains(.,'26')]
  Click Element    locator=//div[@class='calendar-body__cell'][contains(.,'26')]

Then select the quantity of passengers and search
  Wait Until Element Is Visible    locator=//div[@class='alert__wrapper ng-star-inserted'][contains(.,'Choose passengers based on their age at the time of travel.')]
  Click Element    locator=(//div[contains(@data-ref,'counter.counter__increment')])[3]
  Wait Until Element Contains    locator=//div[@class='input-button__input input-button__display-value--truncate-text ng-star-inserted'][contains(.,'1 Adult, 1 Child')]    text=1 Adult, 1 Child
  Click Element    locator=//span[@class='ng-tns-c81-3 ng-star-inserted'][contains(.,'Search')]

Given the user is on the flight page Should the user can select one flight
  Sleep    5s
  Wait Until Element Is Visible    locator=//h3[@class='header__title ng-tns-c166-6'][contains(.,'Dublin to Athens')]
  Click Element    locator=//button[contains(@class,'card-price__button ng-tns-c162-16 ry-button--gradient-blue ng-star-inserted')]
  Click Element    locator=//button[@color='gradient-blue'][contains(.,'Select')]

Then the user can choose a fare
  Wait Until Element Is Visible    locator=//h3[@class='fare-selector__title ng-tns-c170-18'][contains(.,'Fares')]
  Wait Until Element Is Visible    locator=//div[@class='journey-message text-700'][contains(.,'The selected fare type applies to all passengers for all flights')]    timeout=10
  Sleep    10s
  Click Button    locator=${FARE}
  Wait Until Element Is Visible    locator=//h3[@class='fare-selection-summary__title'][contains(.,'Your selected fare')]

And the user can put the names of passengers
  Sleep    7s
  Wait Until Element Is Visible    locator=//h3[@class='app-title'][contains(.,'Passengers')]
  Click Element    locator=//button[@type='button'][contains(.,'-')]
  Click Element    locator=//button[contains(@class,'dropdown-item__link dropdown-item__link--highlighted')]
  Click Element    locator=//input[contains(@name,'form.passengers.ADT-0.name')]
  Input Text    locator=//input[contains(@name,'form.passengers.ADT-0.name')]    text=Ryanair
  Input Text    locator=//input[contains(@name,'form.passengers.ADT-0.surname')]    text=Test
  Click Element    locator=//input[contains(@name,'form.passengers.CHD-0.name')]
  Input Text    locator=//input[contains(@name,'form.passengers.CHD-0.name')]    text=Reyanair
  Input Text    locator=//input[contains(@id,'form.passengers.CHD-0.surname')]    text=Test
  Sleep    2s
  Click Button    locator=//button[@color='gradient-yellow'][contains(.,'Continue')]

Should the user can select an family seating
  Sleep    10s
  Wait Until Page Contains Element    locator=//h4[@class='seats-modal__title'][contains(.,'Family seating')]
  Click Element    locator=//button[@class='seats-modal__cta body-l-lg ry-button--gradient-blue'][contains(.,'Okay, got it.')]
  Click Element    locator=//button[contains(@id,'seat-30D')]
  Click Element    locator=//button[contains(@id,'seat-30E')]
  Click Element    locator=//button[@class='ry-button ry-button--gradient-blue seats-action__button ry-button--flat-blue'][contains(.,'Next flight')]
  Sleep    5s
  Click Element    locator=//button[contains(@id,'seat-30D')]
  Click Element    locator=//button[contains(@id,'seat-30E')]
  Click Element    locator=//button[@class='ry-button seats-action__button ry-button--flat-blue ry-button--gradient-yellow'][contains(.,'Continue')]
  Sleep    3s
  Click Element    locator=//button[@color='anchor-blue'][contains(.,'No, thanks')]

Then the user can select a type of bags
  Sleep    10s
  # Wait Until Page Contains Element    locator=//span[@class='main-header__title title-m-lg'][contains(.,'Cabin Bags')]
  # Click Element    locator=//label[contains(@for,'ry-radio-button--6')]
  # Sleep    3s
  Click Element    locator=//button[@color='gradient-yellow'][contains(.,'Continue')]

And should select all flight extras
  Sleep    10s
  Click Element    locator=//button[@size='large'][contains(.,'Continue')]
  Sleep    10s
  Wait Until Page Contains Element    locator=//div[@class='info-card__title h1']
  Click Element    locator=//button[@size='large'][contains(.,'Continue')]

Given the user selected all extras can plan a trip
  Sleep    10s
  Wait Until Page Contains Element    locator=//h3[@class='section-header__title section-header__title--desktop'][contains(.,'Plan your whole trip')]
  Click Element    locator=//button[@data-ref='trip-overview-container-checkout-button'][contains(.,'Go to checkout')]

Should the user put the payment method
  Sleep    15s
  # Wait Until Page Contains Element    locator=//h3[@tabindex='0'][contains(.,'Contact details')]
  Click Element    locator=//input[contains(@name,'phone-number')]  
  Input Text    locator=//input[contains(@name,'phone-number')]     text=0332551337
  Sleep    3s
  Wait Until Page Contains Element    locator=//div[contains(@class,'payment-methods__method b2 ng-star-inserted')]
  Click Element    locator=//div[contains(@class,'payment-methods__method b2 ng-star-inserted')]
  Wait Until Page Contains Element    locator=/html/body/app-root/div/ry-input-d/div
  Click Element    locator=/html/body/app-root/div/ry-input-d/div
  Input Text    locator=/html/body/app-root/div/ry-input-d/div    text=${CARD_NUMBER}
  Click Element    locator=//input[@name='cc-exp']
  Input Text    locator=//input[@name='cc-exp']    text=${EXPIRE_DATE}
  Click Element    locator=//input[contains(@name,'cvc')]
  Input Text    locator=//input[contains(@name,'cvc')]    text=${CVC}
  Click Element    locator=//input[contains(@name,'ccname')]
  Input Text    locator=//input[contains(@name,'ccname')]    text=Ryanair Test
  Click Element    locator=//input[contains(@name,'address-line1')]
  Input Text    locator=//input[contains(@name,'address-line1')]    text=Rua 9
  Click Element    locator=//input[contains(@name,'city')]
  Input Text    locator=//input[contains(@name,'city')]    text=Itatiaia
  Click Element    locator=//input[contains(@name,'city')]
  Input Text    locator=    text=Brazil
  Click Element    locator=${COUNTRY}
  Click Element    locator=//input[contains(@name,'postcode')]
  Input Text    locator=//input[contains(@name,'postcode')]    text=27580000
  Click Element    locator=//button[@type='button'][contains(.,'Select a currency')]
  Click Element    locator=//div[@class='dropdown-item__label b2'][contains(.,'USD ($545.61)')]
  Click Element    locator=//div[@data-ref='terms-and-conditions__content-flights'][contains(.,'By clicking Pay Now, I confirm I have read and accepted:')]
  Click Element    locator=//button[@color='gradient-yellow'][contains(.,'Pay now')]
  
Then the transaction has to not be completed
  Sleep    10s
  Wait Until Page Contains Element    locator=//div[@class='b2 ng-star-inserted'][contains(.,'Transaction could not be processed. Your payment was not authorised therefore we could not complete your booking. Please ensure that the information was correct and try again or use a new payment card.')]