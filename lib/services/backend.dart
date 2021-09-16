class BackendUrl {
  // change this to be from environment/constant id
  static const String baseUrl = 'https://spdb.000webhostapp.com';

  // auth URLs
  static const String login = baseUrl + '/auth/login.php';
  static const String register = baseUrl + '/auth/register.php';

// profile urls
  static const String getProfile = baseUrl + '/donor/getProfile.php';
  static const String createProfile = baseUrl + '/donor/addProfile.php';
  static const String updateProfile = baseUrl + '/donor/updateProfile.php';
  static const String deleteProfile = baseUrl + '/donor/deleteProfile.php';
}
