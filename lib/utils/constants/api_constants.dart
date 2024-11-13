class ApiConstants {
  // static const baseUrl = 'http://192.168.1.12:8080/';
  static const baseUrl = 'https://valet-parking-back-end-production.up.railway.app/';
  // static const baseUrl = 'http://192.168.100.27:8080/';
  // static const baseUrl = 'http://192.168.10.10:8080/';

  static const loginUrl = 'owner/loginWithOwner';
  static const fillYourAccountUrl = 'owner/signUpWithOwner';
  static const getAllDriversAndGarageDetailsUrl = 'owner/getAllAdmin';
  static const getAllUsersUrl = 'owner/getAllUsers';
  static const addToWalletUrl = 'owner/addToWallet/';
  static const deleteSpecificGarageUrl = 'owner/deleteSpecificGarageData/';
  static const deleteSpecificDriverUrl = 'owner/removeSpecificAdmin/';
  static const getAllGaragesUrl = 'owner/getAllGaragesInOwner';
  static const getAttendanceInTodayUrl = 'owner/getAttendanceOfCurrentDate';
  static const getAttendanceStartInUrl = 'subOwner/getAttendanceStartIn';
  static const getAttendanceEndInUrl = 'subOwner/getAttendanceEndIn';
  static const addNewGarageUrl = 'owner/addNewGarage';
  static const addToDriverUrl = 'owner/addNewDriverOrSubOwner';
  static const updateGarageUrl = 'owner/updateSpecificGarage/';
  static const updateSpecificDriverUrl = 'owner/updataAdminData/';
}