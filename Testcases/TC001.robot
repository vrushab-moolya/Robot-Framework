*** Settings ***
Resource  ../Operational/instructions.robot
Resource  ../Operational/variables.robot

*** Test Cases ***
User should be able to add book to cart
    [Tags]    demo
    Open indian book store 
    Clicking on Actions & Adventures 
    Click on Adventure sub section
    Search for Harry Potter book
    Go to expected book
    Choosing Flipkart to buy the book
    Switching the tab and selecting the book
    Switching the tab and adding to cart
