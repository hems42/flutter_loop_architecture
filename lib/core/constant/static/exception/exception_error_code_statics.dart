class ExceptionErrorCodeCostants {
  /*
    
    
    CUSTOM EXCEPTION CODES:
    
   ******************************************************************
    
    Error_MainGroupCodeList :
    
    - UN                      : 10
    - ALREADY                 : 20
    - NOT                     : 30
    - NON                     : 40
    - FORBIDDEN               : 50
    
    
    
    
   *****************************************************************
    
    Error_SubGroupCodeList :
    
     - EXIST                  : 10
     - VALID                  : 20
     - FOUND                  : 30
     - SUCCESS                : 40
     - ACCEPT                 : 50
     - AUTHORIZE              : 60
     
	
   ******************************************************************
    
    Error_EntityCodeList :
    
      - USER                  : 010
      - ROLE                  : 020
      - REQUEST               : 030
      - REFRESH TOKEN         : 040
      - CONFIRMATION TOKEN    : 050
      - ACCESS TOKEN          : 060
      - REGISTRATION          : 070
      - LOGIN                 : 080
      - EMAIL                 : 090 
      - SIGNUP                : 100
      - LOGIN                 : 101
      - LOGOUT                : 102
           
     
   ******************************************************************
    
    Error_EventCodeList :
    
     
     
    
     */

  //-Error_MainGroupCodeList :

  static final String _UN = "10";
  static final String _ALREADY = "20";
  static final String _NOT = "30";
  static final String _NON = "40";
  static final String _FORBIDDEN = "50";

  //-Error_SubGroupCodeList :

  static final String _EXIST = "10";
  static final String _VALID = "20";
  static final String _FOUND = "30";
  static final String _SUCCESS = "40";
  static final String _ACCEPT = "50";
  static final String _AUTHORIZE = "60";

  //-Error_EntityCodeList :

  static const String T_USER = "010";
  static const String T_ROLE = "020";
  static const String T_REQUEST = "030";
  static const String T_REFRESH_TOKEN = "040";
  static const String T_CONFIRMATION_TOKEN = "050";
  static const String T_ACCESS_TOKEN = "060";
  static const String T_REGISTRATION = "070";
  static const String T_EMAIL = "080";
  static const String T_SIGNUP = "090";
  static const String T_LOGIN = "091";
  static const String T_LOGOUT = "092";

  //-Error_ExceptionMessageCodeList :

  static String B_NOT_FOUND_EXCEPTION_ERROR_CODE = _NOT + _FOUND;
  static String B_ALREADY_EXIST_EXCEPTION_ERROR_CODE = _ALREADY + _EXIST;
  static String B_ALREADY_ACCEPTED_EXCEPTION_ERROR_CODE = _ALREADY + _ACCEPT;
  static String B_FORBIDDEN_EXCEPTION_ERROR_CODE = _FORBIDDEN + "00";
  static String B_UN_AUTHORIZE_EXCEPTION_ERROR_CODE = _UN + _AUTHORIZE;
  static String B_UN_SUCCESSFUL_EXCEPTION_ERROR_CODE = _UN + _SUCCESS;
  static String B_UN_ACCEPTABLE_EXCEPTION_ERROR_CODE = _UN + _ACCEPT;
  static String B_NOT_VALID_EXCEPTION_ERROR_CODE = _NOT + _VALID;

  //-Error_EventCodeList :

  static String D_EMAIL_ALREADY_USED = "0001";
  static String D_USERNAME_ALREADY_USED = "0002";
  static String D_EMAIL_AND_USERNAME_ALREADY_USED = "0003";

  // USER
  static String D_USER_NOT_CREATED = "0010";
  static String D_USER_ALREADY_REGISTERED = "0011";
  static String D_USER_NOT_REGISTERED = "0012";
  static String D_USER_NOT_FOUND = "0013";
  static String D_USER_NOT_ACTIVE = "0014";
  static String D_USER_ALREADY_LOGIN = "0015";

  // AUTHENTICATION
  static String D_ACCESS_TOKEN_NOT_CREATED_OR_SAVED = "0020";
  static String D_ACCESS_TOKEN_STILL_VALID = "0021";
  static String D_REFRESH_TOKEN_NOT_CREATED_OR_SAVED = "0024";
  static String D_REFRESH_TOKEN_NOT_FOUND = "0025";
  static String D_REFRESH_TOKEN_NOT_VALID = "0026";
  static String D_CONFIRMATION_TOKEN_NOT_CREATED_OR_SAVED = "0030";
  static String D_CONFIRMATION_TOKEN_NOT_FOUND = "0031";
  static String D_CONFIRMATION_TOKEN_EXPIRED = "0032";
  static String D_CONFIRMATION_TOKEN_ALREADY_USED = "0033";
  static String D_CONFIRMATION_TOKEN_NOT_REGISTERED = "0034";
}
