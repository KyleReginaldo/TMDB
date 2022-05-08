import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void toHome() {
    emit(HomeInitial());
  }

  void goFavorites() {
    emit(Favorites());
  }
}
