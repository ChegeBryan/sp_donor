class BackendUrl {
  // change this to be from environment/constant id
  static const String baseUrl = 'https://sperm-db.loca.lt';

  // auth URLs
  static const String login = baseUrl + '/auth/login.php';
  static const String register = baseUrl + '/auth/register.php';

  static const String getProfile = baseUrl + '/donor/getProfile.php';
}
