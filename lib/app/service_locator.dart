import 'package:get_it/get_it.dart';
import 'package:setup_mvvm/screens/login/login_viewmodel.dart';
import 'package:setup_mvvm/services/authentication/authentication_service.dart';
import 'package:setup_mvvm/services/authentication/authentication_service_firebase.dart';
import 'package:setup_mvvm/services/user/user_service_firestore.dart';
import '../screens/adminhome/adminhome_viewmodel.dart';
import '../screens/adminlogin/adminlogin_viewmodel.dart';
import '../screens/adminprofile/adminprofile_viewmodel.dart';
import '../screens/approvebooking/approvebooking_viewmodel.dart';
import '../screens/bookroom/bookroom_viewmodel.dart';
import '../screens/history/history_viewmodel.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/profile/profile_viewmodel.dart';
import '../screens/updatebooking/updatebooking_viewmodel.dart';
import '../services/all_bookings/all_bookings_service.dart';
import '../services/all_bookings/all_bookings_service_firestore.dart';
import '../services/booking/booking_service.dart';
import '../services/booking/booking_service_firestore.dart';
import '../services/user/user_repository.dart';
import '../services/room/room_service.dart';
import '../services/room/room_service_firestore.dart';
import '../services/user/user_service.dart';

GetIt locator = GetIt.instance;

void initializeServiceLocator() {
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceFirebase());
  locator.registerLazySingleton<UserService>(() => UserServiceFirestore());
  locator.registerLazySingleton<RoomService>(() => RoomServiceFirestore());
  locator
      .registerLazySingleton<BookingService>(() => BookingServiceFirestore());
  locator.registerLazySingleton<AllBookingsService>(
      () => AllBookingsServiceFirestore());

  // Repositories
  locator.registerLazySingleton<UserRepository>(() => UserRepository());

  // Viewmodels
  locator.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel());
  locator.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
  locator.registerLazySingleton<BookRoomViewmodel>(() => BookRoomViewmodel());
  locator.registerLazySingleton<HistoryViewmodel>(() => HistoryViewmodel());
  locator
      .registerLazySingleton<AdminLoginViewmodel>(() => AdminLoginViewmodel());
  locator.registerLazySingleton<AdminHomeViewmodel>(() => AdminHomeViewmodel());
  locator.registerLazySingleton<ApproveBookingViewmodel>(
      () => ApproveBookingViewmodel());
  locator.registerLazySingleton<UpdateBookingViewmodel>(
      () => UpdateBookingViewmodel());
  locator.registerLazySingleton<ProfileViewmodel>(() => ProfileViewmodel());
  locator.registerLazySingleton<AdminProfileViewmodel>(
      () => AdminProfileViewmodel());
}
