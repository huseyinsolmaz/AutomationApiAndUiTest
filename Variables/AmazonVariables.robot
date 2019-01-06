*** Variables ***
${VALID_USER}     angealhelwey@gmail.com
${VALID_PASSWORD}    12801988
${accountListNav}  id:nav-link-accountList
${signInLink}  xpath://a[@data-nav-ref="nav_signin"]
${emailInput}  id:ap_email
${passwordInput}  id:ap_password
${signInButton}  id:signInSubmit
${searchInput}  id:twotabsearchtextbox
${searchButton}  xpath://input[@value="Go"]
${searchKeywordSpan}  xpath://div[@id="s-result-info-bar-content"]//span[@class="a-color-state a-text-bold"]
${pageNumber}  class:pagnLink
${currentPageNumber}  class:pagnCur
${productNameLink}  xpath://li[3]//h2
${wishListDropDown}  id:wishListDropDown
${wishListOption}  xpath://li[@class="a-dropdown-item"][2]
${wishListProductInfo}  xpath://div[@id="WLHUC_info"]//a
${continueButton}  id:WLHUC_continue
${wishListLink}  xpath://div[@id="nav-flyout-wl-items"]//a[2]/span
${productDeleteButton}  xpath://input[@name="submit.deleteItem"]
${alertContent}  xpath://ul[@id="g-items"]//div[@class="a-alert-content"]