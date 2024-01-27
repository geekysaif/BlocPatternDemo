class Urls {
  //develop
  /*static String baseUrl = "https://dev-api.nimeya.ai/api/";
  static String iconsBaseUrl = "https://dev-api.nimeya.ai/img/icons/";
  static String razarpay_key = "rzp_test_AdFDgVWagtsr6M";
  static String revenuecat_key = "appl_BwHPaosmTmjqlEAVyoqRALTMyMg"; */ //test mode

  //production
  static String baseUrl = "https://api-prod.nimeya.ai/api/";
  static String iconsBaseUrl = "https://api-prod.nimeya.ai/img/icons/";
  static String razarpay_key = "rzp_live_ptqDnbRLNbkuvA"; //live mode
  static String revenuecat_key = "appl_BwHPaosmTmjqlEAVyoqRALTMyMg"; //live mode

  /*login*/
  // String login = baseUrl + "login";
  String login = baseUrl + "login-with-mobile-devices";

  /*logout*/
  String logout = baseUrl + "logout";

  //loginverifydevice
  String verifyloginotp = baseUrl + "verify-login-otp";

  /*get-notification-status */
  String get_notification_status =
      baseUrl + "get-push-email-status-notification";

  /*get-notification-status */
  String update_notification_status =
      baseUrl + "update-push-email-status-notification";

  String email_verification_status =
      baseUrl + "change-email-verification-status";

  //change_password_notification
  String password_notification = baseUrl + "change-password-notification";

  /*register*/
  String register = baseUrl + "register";

  /*send-otp*/
  String send_otp = baseUrl + "send-otp";

  /*verify-otp*/
  String verify_otp = baseUrl + "verify-otp";

  /*pin_login*/
  String pin_login = baseUrl + "pin-login";

  /*setup_pin*/
  String setup_pin = baseUrl + "setup-pin";

  /*fingerprint_login*/
  String fingerprint_login = baseUrl + "fingerprint-login";

  /*setup_fingerprint*/
  String setup_fingerprint = baseUrl + "setup-fingerprint";

  /*get-country-code-list*/
  String getcountrycode = baseUrl + "get-country-code-list";

  /*get-term-and-service*/
  String gettermandservice = baseUrl + "get-term-and-service";

  /*get_referral_detail*/
  String get_referral_detail = baseUrl + "get-referral-detail";

  /*get-profile-detail*/
  String get_profile_detail = baseUrl + "get-profile-detail";

  /*update-profile-detail*/
  String update_profile_detail = baseUrl + "update-profile-detail";

  /*get-member-type-list*/
  String get_member_type_list = baseUrl + "get-member-type-list";

  /*update-profile-detail*/
  String save_contact_detail = baseUrl + "save-contact-detail";

  /*save-family-member-detail*/
  String save_family_member_detail = baseUrl + "save-family-member-detail";

  /*get-family-member*/
  String get_family_member_list = baseUrl + "get-family-member-list";

  /*delete-family-member*/
  String delete_family_member = baseUrl + "delete-family-member";

  /*update-family-member-detail*/
  String update_family_member_detail = baseUrl + "update-family-member-detail";

  /*get-subscription-list*/
  String get_subscription_list = baseUrl + "get-subscription-plan-list";

  /*get_purchasedsubscription_list*/
  String get_purchasedsubscription_list = baseUrl + "get-user-plan";

  /*get subscription detail*/
  String get_subscription_detail = baseUrl + "get-subscription-plan-detail";

  /*create_plan_subscription_order*/
  String create_plan_subscription_order =
      baseUrl + "create-plan-subscription-order";

  /*create_user_plan_subscription*/
  String create_user_plan_subscription =
      baseUrl + "create-user-plan-subscription";

  /*verify_razorpay_signature*/
  String verify_razorpay_signature = baseUrl + "verify-razorpay-signature";

  /*purchased_congralutaions*/
  String purchased_congralutaions = baseUrl + "get-user-plan-detail";

  /*cancel-subscription*/
  String cancel_subscription = baseUrl + "cancel-subscription";

  /*Investometer*/
  String get_investometer_list = baseUrl + "get-investometer-list";

  /*get-notification-list*/
  String get_notification_list = baseUrl + "get-notification-list";

  /*TRACK INVESTMENT*/
  //String get_deposit_detail = baseUrl + "get-user-form-detail-apps";
  //String get_deposit_detail = baseUrl + "get-user-form-detail-mobile-app";
  String get_deposit_detail = baseUrl + "get-user-form-detail";
  String track_investment_list = baseUrl + "category-listing";
  String track_investment_subcat_list = baseUrl + "subcategory-listing";
  String track_investment_subcatchild_list =
      baseUrl + "child-subcategory-listing";

  //DEPOSIT Accounts
  String get_dynamic_form = baseUrl + "get-form";
  String get_dynamic_editform = baseUrl + "get-edit-form-detail";
  String save_user_form_detail = baseUrl + "save-user-form-detail";
  String update_form = baseUrl + "update-form";
  String delete_form = baseUrl + "delete-form";
  String get_scheme_name = baseUrl + "get-scheme-name";

  // MUTUAL FUNDS
  String get_mutual_fund_detail =
      baseUrl + "get-user-mutual-fund-form-mobile-detail";
  String get_nav_detail = baseUrl + "get-scheme-name-detail";
  String get_mutualfund_editform = baseUrl + "get-mutual-fund-edit-form-detail";

  // EQUITY&BONDS
  String get_equity_bond_form = baseUrl + "get-equity-bond-form";
  String get_security_name = baseUrl + "get-security-list";
  String save_equity_bond_form = baseUrl + "save-equity-bond-form";
  String get_security_name_details = baseUrl + "get-security-detail";
  String get_series_list = baseUrl + "get-series-list";
  String get_series_details = baseUrl + "get-series-detail";
  String get_equitybond_edit_form_details =
      baseUrl + "get-equity-edit-form-detail";
  String save_mutual_fund_form_detail = baseUrl + "save-mutual-fund-data";
  String update_equitybond_edit_form_details =
      baseUrl + "update-equity-bond-form-detail";
  String get_equity_dashboard_details =
      baseUrl + "get-user-equity-bond-form-detail";

  // Bullions
  String get_bullion_form = baseUrl + "get-bullion-form";
  String get_purity_list = baseUrl + "get-purity-list";
  String get_price_of_purity = baseUrl + "get-price-of-purity";
  String get_gold_bond = baseUrl + "get-gold-bond";
  String save_bullions_form = baseUrl + "save-bullion-form-detail";
  String get_bullions_dashboard_details = baseUrl + "get-bullion-form-detail";
  String get_edit_bullions_form = baseUrl + "get-edit-bullion-form-detail";
  String update_bullion_form = baseUrl + "update-bullion-form";

  // Retirement
  String get_retirement_form = baseUrl + "get-retirement-form";
  String save_retirement_form = baseUrl + "save-retirement-form-detail";
  String get_retirement_dashboard_details =
      baseUrl + "get-retirement-form-detail";
  String get_edit_retirement_form = baseUrl + "get-edit-retirement-form-detail";
  String update_retirement_form = baseUrl + "update-retirement-form";
  String get_policy_name = baseUrl + "get-policy-name";
  String get_user_dob = baseUrl + "get-user-dob";

  // realestate
  String get_realestate_form = baseUrl + "get-real-estate-form";
  String get_realestatecity = baseUrl + "get-city";
  String get_realestatelocation = baseUrl + "get-location-list";
  String get_investment_trust_list = baseUrl + "get-investment-trust-list";
  String get_investment_trust_price = baseUrl + "get-investment-trust-price";
  String save_realestate_form = baseUrl + "save-real-estate-form-detail";
  String get_realestate_dashboard_details =
      baseUrl + "get-real-estate-form-detail";
  String get_edit_rrealestate_form =
      baseUrl + "get-edit-real-estate-form-detail";
  String update_realestate_form = baseUrl + "update-real-estate-form";

  //Private investment
  String get_privateinvestment_form = baseUrl + "get-private-investment-form";
  String save_privateinvestment_form =
      baseUrl + "save-private-investment-detail";
  String get_privateinvestment_dashboard =
      baseUrl + "get-private-investment-form-detail";
  String get_edit_privateinvestment_form_details =
      baseUrl + "get-edit-private-investment-form-detail";
  String update_privateinvestment_form =
      baseUrl + "update-private-investment-form";
  String get_pms_aif_name = baseUrl + "get-pms-aif-name";

  //insurance
  String get_insurance_form = baseUrl + "get-insurance-form";
  String save_insurance_form = baseUrl + "save-insurance-form";
  String get_insurance_policy_name = baseUrl + "get-insurance-policy-name";
  String get_insurance_dashboard = baseUrl + "get-insurance-form-details";
  String get_edit_insurance_form_details =
      baseUrl + "get-insurance-edit-form-details";
  String update_insurance_form = baseUrl + "update-insurance-form-details";

  // commodities
  String get_commodities_form = baseUrl + "get-commodity-form";
  String get_commodities_list = baseUrl + "get-commodity-list";
  String get_commodities_locationform =
      baseUrl + "get-commodity-location-list"; //need to change
  String get_commodities_locationpriceform =
      baseUrl + "get-commodity-price-list"; //need to change
  String save_commodities_form =
      baseUrl + "save-commodity-form-detail"; //need to change
  String get_commodities_dashboard_details =
      baseUrl + "get-commodity-form-detail"; //need to change
  String get_edit_commodities_form_details =
      baseUrl + "get-edit-commodity-form-detail"; //need to change
  String update_commodities_form =
      baseUrl + "update-commodity-form"; //need to change

  // LIABILITIES
  String get_liabilities_form = baseUrl + "get-liability-form";
  String get_liabilities_dashboard_details =
      baseUrl + "get-liability-form-detail";
  String get_liabilities_edit_form = baseUrl + "get-edit-liability-form-detail";
  String save_liabilities_form_detail = baseUrl + "save-liability-form-detail";
  String update_liabilities_form = baseUrl + "update-liability-form";

  // accounts
  String get_accounts_form = baseUrl + "get-account-form";
  String get_accounts_dashboard_details = baseUrl + "get-account-form-detail";
  String get_accounts_edit_form = baseUrl + "get-edit-account-form-detail";
  String save_accounts_form_detail = baseUrl + "save-account-form-detail";
  String update_accounts_form = baseUrl + "update-account-form";
  String get_account_depository_name = baseUrl + "get-account-depository-name";

  /*params:No params*/
  String checkVersion = baseUrl + "check-version";
  String loadOrderInvoice = baseUrl + "load_order_invoice";

  static final Urls _urls = new Urls._internal();
  factory Urls() {
    return _urls;
  }
  Urls._internal();
}

Urls urls = new Urls();
