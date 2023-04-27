import 'package:get/get.dart';

import '../../../constants/storage_keys.dart';
import '../../../models/user_model.dart';
import '../../../pages_routes/app_pages.dart';
import '../../../services/utils_services.dart';
import '../repository/auth_repository.dart';
import '../result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  Future<void> validateToken() async {
    // Recuperar o token que foi salvo localmente
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);
    print('Token: $token');

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }
    AuthResult result = await authRepository.validateToken(token);
    result.when(success: ((user) {
      print('Sucess - validateToken()');
      this.user = user;
      saveTokenAndProceedToBase();
    }), error: (message) {
      print('Eror - validateToken()');
      signOut();
    });
  }

  Future<void> signOut() async {
    // Zerar o user
    user = UserModel();

    // Remover o token localmente
    utilsServices.removeLocalData(key: StorageKeys.token);

    // Ir para Sign In
    Get.offNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    // Salvar o token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    // Ir para a tela base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResult result = await authRepository.signup(user);
    isLoading.value = false;
    result.when(
      success: (user) {
        //print(user);
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        //print(message);
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    //await Future.delayed(const Duration(seconds: 2));
    AuthResult result =
        await authRepository.signIn(email: email, password: password);
    isLoading.value = false;

    result.when(
      success: (user) {
        //print(user);
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: ((message) {
        //print(message);
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      }),
    );
  }
}
