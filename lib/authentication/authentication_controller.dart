import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'authentication_service.dart';
import 'authentication_state.dart';
import 'package:dio/dio.dart';

class AuthenticationController extends GetxController {
  final AuthenticationService _authenticationService;
  final _authenticationStateStream = AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController(this._authenticationService);

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password, String url) async {
    try {
      final user = await _authenticationService.signInWithEmailAndPassword(
          email, password, url);
      final connection = _authenticationService.getCurrentConnection();
      final currentBaseUrl = _authenticationService.getCurrentBaseUrl();
      _authenticationStateStream.value =
          Authenticated(user: user, connection: connection, currentBaseUrl: currentBaseUrl);
    } catch (e) {
      if(e is DioError){
        if((e as DioError).response == null) {
          print(e.message);
          throw AuthenticationException(
              message: 'Не удалось установить соединение по указанному адресу');
        }
        if((e as DioError).response.statusCode == 401)
          throw AuthenticationException(message: 'Не удалось авторизироваться в системе. Проверьте корректность логина и пароля');
      } else
         throw AuthenticationException(message: 'Ошибка запроса, свяжитесь с администратором');
    }
  }

  void signOut() async {
    await _authenticationService.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final user = await _authenticationService.getCurrentUser();
    final connection = _authenticationService.getCurrentConnection();
    final currentBaseUrl = _authenticationService.getCurrentBaseUrl();
    if (user == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value =
          Authenticated(user: user, connection: connection, currentBaseUrl: currentBaseUrl);
    }
  }
}
