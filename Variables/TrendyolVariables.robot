*** Variables ***
${loginIcon}  xpath=//*[@id='accountNavigationRoot']//i
${closeIcon}  xpath=//*[@title="Close"]
${emailInput}  id=email
${passwordInput}  id=password
${loginButton}  id=loginSubmit
${boutiqueMainPath}  id=item
${boutiqueMainBannerImgPath}  xpath=//div[@id="dynamic-banners"]/*[contains(@data-view-content,'text/x-custom-template')]
${boutiqueMainImgPath}  xpath=//div[@data-order
${loginIconName}   id=logged-in-container
${productPath}  xpath=//li[@data-id]
${addToBasket}  xpath=//div[contains(text(),'Sepete Ekle')]
${sizeDropdown}  xpath=//*[@class="caret"]
${sizeSelect}  xpath=//*[@class="vrn-item"]
${myBasketOnTop}  id=myBasketListItem
${productOnBasket}  xpath=//ul/li[@data-id]
${putApiSuccessMessage}  PutApi test status code is correct
${putApiFailMessage}  PutApi test status code isn't correct
${putApiDuplicateSuccessMessage}  PutApi duplicate test status code is correct
${putApiDuplicateFailMessage}  PutApi duplicate test status code isn't correct
${dublicateErrormessage}  Another book with similar title and author already exists.
${putApiDuplicateErrorSuccessMessage}  PutApi duplicate test error message is correct
${putApiDuplicateErrorFailMessage}  PutApi duplicate test error message isn't correct
${idTestSuccessCodeMessage}  Empty title test status code is correct
${idTestfailCodeMessage}  Empty title test status code isn't correct
${idTestSuccessExpectMessage}  Field 'ID' should be empty.
${idTestSuccessExceptMessage}  Empty ID Error message is Correct
${idTestfailExceptMessage}  Empty ID Error message isn't correct
${titleTestSuccessCodeMessage}  Empty title test status code is correct
${titleTestfailCodeMessage}  Empty title test status code isn't correct
${titleTestSuccessExpectMessage}  Field 'Title' cannot be empty.
${titleTestSuccessExceptMessage}  Empty Title Error message is Correct
${titleTestfailExceptMessage}  Empty Title Error message isn't correct
${authorTestSuccessCodeMessage}  Empty author test status code is correct
${authorTestSuccessExpectMessage}  Field 'Author' cannot be empty.
${authorTestSuccessExceptMessage}  Empty author Error message is Correct
${authorTestfailExceptMessage}  Empty author Error message isn't correct
${authorTestfailCodeMessage}  Empty author test status code isn't correct
${emptyBookTestSuccessCodeMessage}  Book List Empty
${emptyBookTestfailCodeMessage}  Book List isn't Empty!!
${apiURL}  http://foobarBookApi.com
${apiPath}  /api/book