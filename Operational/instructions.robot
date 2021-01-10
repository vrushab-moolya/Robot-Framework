*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Keywords ***
Open indian book store
    Open Browser    ${url}    ${brow}
    Maximize Browser Window
    sleep  1s
    Execute Javascript  window.scrollTo(0, 500) 

Clicking on Actions & Adventures  
     ${category_count} =  Get Element Count   xpath=//*[@id='leftNavContainer']/ul/li
    sleep  3s
    FOR  ${i}   IN RANGE    1   ${category_count}
        ${dynamic_categ_name} =  Get Text   xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Scroll Element Into View    xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
        Log to Console  ${dynamic_categ_name}
        Exit For Loop If    "${dynamic_categ_name}" == "${expectedcategory}"
    END
    Set Test Variable  ${static_categ_name}  xpath=//*[@id="leftNavContainer"]/ul/li[${i}]/a
    Log to Console  Step 2


Click on Adventure sub section
    Mouse Over  ${static_categ_name}
    sleep  1s
    Mouse Over  ${Adventure}
    sleep  1s 
    Click Element  ${Adventure}
    sleep  1s
    Log to Console  Step 3


Search for Harry Potter book
    ${buk_list} =  Get Element Count  xpath=//div[@class='col-md-9']/div
    #Log to Console  ${buk_list}
    FOR  ${j}  IN RANGE  2  ${buk_list}
    ${buk_names} =  Get Text  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    #Log to Console  ${buk_names}
    Exit For Loop If  "${buk_names}" == "${Expected_Book_Name}"
    END
    Set Test Variable  ${exact_buk_elem}  xpath=//div[@class='col-md-9']/div[${j}]/a/div[3]
    Log to Console  Step4


Go to expected book
    sleep  2s
    Click Element  ${exact_buk_elem}
    Log to Console  Step5




Choosing Flipkart to buy the book
    Click Element  ${Flipkart}
    Log to Console  Step6


Switching the tab and selecting the book
    select window  9788498386943- Buy Products Online at Best Price in India - All Categories | Flipkart.com
    ${url1} =  get Location
    log to console  ${url1}
    Click Element  ${page2}
    log to console  Step7


Switching the tab and adding to cart
    select window  Harry Potter Y La Piedra Filosofal / Harry Potter and the Sorcerer's Stone: Buy Harry Potter Y La Piedra Filosofal / Harry Potter and the Sorcerer's Stone by Rowling J K at Low Price in India | Flipkart.com
    ${url2} =  get Location
    log to console  ${url2}
    Click Element  ${page3}



