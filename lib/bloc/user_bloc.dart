import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_bijak/models/user_model.dart';

class UserBloc extends Cubit<UserModel?> {
  UserBloc() : super(null);
  void saveUser(UserModel? user) {
    emit(user);
  }
}
