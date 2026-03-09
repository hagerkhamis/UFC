class Api {
  //base Url

  static const String mainAppUrl = "https://alatheer.site/abnaa/qr_c/";

  static const String baseUrl = "${mainAppUrl}New_api/";

  static const String doServerLoginApiCall = "login_by_mobile";
  static const String doFireBasePhoneTokenApiCall = "insert_update_token";
  static const String doFingerPrintApiCall = "Basma_Today";
  static const String doNewMessageCall = "save_message";
  static const String doServerTablesApiCall = "Report_Basma";
  static const String doServerGetMessagesApiCall = "get_messages";

  static const String doServerCalenderApiCall = "report_calender";
}

class NewApi {
  static const String mainAppUrl = "https://metacodecx.com/UFC/";
  //static Box<CodeEntity> box = Hive.box<CodeEntity>(kCodeDataBox);

  static String get baseUrl => mainAppUrl;

  static String get imageBaseUrl => mainAppUrl;

  static const String doServerLoginApiCall = "Api/login_app";
  static const String doServerRegisterApiCall = "Api/register";
  static const String doServerChangePasswordApiCall = "Api/update_pass";
  static const String doServerUpdateProfileApiCall = "Api/update_profile_image";
  static const String doServerUpdateSignatureApiCall = "Api/Add_signature";
  static const String doServerGetProfileApiCall = "Api/getProfile";

  static const String doServerNewBasma = "Api/add_hdor_ensraf";

  static const String doServerSendMessageApiCall = "Api/SendMessage";
  static const String doServerAllMessageApiCall = "Api/InboxMessages";
  static const String doServerSentMessageApiCall = "Api/SentMessages";

  static const String doServerMessageDetailsApiCall = "Api/ViewMessage";
  static const String doServerEmployeesApiCall = "Api/AllEmplyees";
  static const String doServerSeenMessageApiCall = "Api/SeenMessage";
  static const String doServerDeleteMessageApiCall = "Api/DeleteMessage";

  static const String doServerAboutAppApiCall = "Api/getAppinfo";
  static const String doServerPrivacyAndPolicyCall = "Api/getAppPolicy";
  static const String doServerAlltypeOzonat = "Api/Ozonat_types";
  static const String doServerAllBranches = "Api/All_Branches";

  static const String doServerAddEzen = "Api/Add_Ezn";
  static const String doServerAllEznApiCall = "Api/Get_Ezn_List";
  static const String doServerDeleteEznApiCall = "Api/Delete_ezn";
  static const String doServerEditEzen = "Api/Edit_Ezn";
  static const String doServerWaredEznApiCall = "Api/Get_Wared_Ezn_List";
  static const String doServerEgraaEznApiCall = "Api/Egraa_ezn";

  static const String doServerAlltypeVacation = "Api/Agazat_types";
  static const String doServerAddVacation = "Api/Add_Agaza";
  static const String doServerAllVacationApiCall = "Api/Get_agaza_List";
  static const String doServerDeleteVacationApiCall = "Api/Delete_agaza";
  static const String doServerEditVacation = "Api/Edit_Agaza";
  static const String doServerEgraaVacationApiCall = "Api/Egraa_agaza";
//news
  static const String doServerGetNewsList = "Api/All_News";

  //inBody

  static const String doServerGetInbodyList = "Api/All_Inbody";

  //Captains
  static const String doServerGetCaptainsList = "Api/All_Captains";
//offer
  static const String doServerGetOfferList = "Api/All_Offers";
  static const String doServerAddFavOffer = "Api/add_offer_favourite";

  //send invitation
  static const String doServerSendInvitation = "Api/Add_invitation";

  //Exercises
  static const String doServerGetExercisesList = "Api/All_Tmareen";
  static const String doServerExercisesCat = "Api/All_Cats";

  //ads
  static const String doServerAdsList = "Api/All_sliders";
//Subscribtions
  static const String doServerGetSubscribtions = "Api/Subs_List";

  static const String doServerAddSubscribtions = "Api/add_app_subs";

  static const String stopedServerSubscribtions = "Api/add_stopped_subs";

  //my subscribtions
  static const String doServerGetMySubscribtions = "Api/My_subs";

  ///
  static const String doServerSeenTa3mem = "Api/SeenTa3mem";

  static const String doServerAddAnswerMosalat = "Api/Add_mosala_response";

  static const String doServerGetLawa2hList = "Api/Get_lawa2h_list";
  static const String doServerSeenLayha = "Api/SeenLayha";

  static const String doServerGetEnzaratList = "Api/Get_Enzarat_list";
  static const String doServerSeenEnzarat = "Api/SeenEnzar";

  static const String doServerEvaluationTypes = "Api/get_evaluation_types";
  static const String doServerAllEmpTaqeem = "Api/All_Emp_Taqeem";
  static const String doServerAllManagerTaqeem = "Api/All_Emp_Manager_Taqeem";
  static const String doServerAllBnodTaqeem = "Api/get_all_bnod_taqeem";
  static const String addTaqeem = "Api/AddTaqeem";
  static const String editTaqeem = "Api/EditTaqeem";

  static const String lastTaqeem = "Api/All_Taqeem_list";
  static const String myTaqeem = "Api/My_Taqeem_list";

  static const String doServerMonth = "Api/Months_List";

  static const String doServerEditTaqeem = "Api/EditTaqeem";
  static const String doServerDeleteTaqeem = "Api/Delete_Taqeem";
  static const String doSplashScreens = "Api/GymSplashScreens";

  static const String doServerServicesList = "Api/AppServices";
  
  static const String doServerDeleteAccount = "Api/delete_account";
}

class CodeApi {
  static const String mainAppUrl = "https://alatheertech.com/";
  static const String baseUrl = "${mainAppUrl}basma/Api/";
  static const String getCodeUrl = "All_Gym";
}
