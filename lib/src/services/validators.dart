import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email';
  }
  if (!email.isEmail) return 'Digite um email válido';
  return null;
}

String? passwordValidator(senha) {
  if (senha == null || senha.isEmpty) {
    return 'Digite seu email';
  }
  if (senha.length < 7) {
    return 'Digite sua senha com pelo menos 7 caracyeres';
  }
  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return 'Digite um nome';
  }

  final names = name.split(' ');
  if (names.length == 1) return 'Digite seu nome completo';
  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return 'Digite um nome';
  }

  if (phone.length < 14 || !phone.isPhoneNumber) return 'Digite um numero valido';
  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return 'Digite um CPF';
  }

  if (!cpf.isCpf) return 'Digite um CPF válido';
  return null;
}
