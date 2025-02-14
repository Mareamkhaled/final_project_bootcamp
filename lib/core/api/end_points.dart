class EndPoints {
  static String basUrl = 'https://food-api-omega.vercel.app/api/v1/user/';
  static String logInUrl = 'signin';
  static String signUpUrl = 'signup';
 static String getUserDataEndPoint (id){
  return 'get-user/$id';
 }

  // static String getUserUrl = 'get-user';
}

class ApiKey {
  static String status = 'status';
  static String errorMsg = 'ErrorMessage';
  static String email = 'email';
  static String name = 'name';
  static String password = 'password';
  static String confirmPassword= 'confirmPassword';
  static String token = 'token';
  static String id = 'id';
  static String location = 'location';
  static String profilePic = 'profilePic';
  static String phone = 'phone';
  static String message = 'message';


}
