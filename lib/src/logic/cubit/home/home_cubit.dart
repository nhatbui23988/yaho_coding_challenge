import 'package:bloc/bloc.dart';
import 'package:yaho_coding_challenge/src/data/model/base/app_error.dart';
import 'package:yaho_coding_challenge/src/data/repository/user_repository.dart';
import 'package:yaho_coding_challenge/src/logic/cubit/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final UserRepository userRepository;

  HomeCubit(this.userRepository) : super(HomeState.initialState());

  Future getUserFirstPage() async {
    try {
      final result = await userRepository.getUserByPage(1);
      emit(HomeState.displayData(result));
    } catch (e) {
      emit(state.copyWith(appError: AppError.unknownError()));
    }
  }

  Future getUserNextPage() async {
    try {
      _showLoadingMore();
      final result = await userRepository.getUserByPage(state.page + 1);
      _hideLoadingMore();
      emit(state.addNewResult(result));
    } catch (e) {
      emit(state.copyWith(appError: AppError.unknownError()));
    }
  }

  void _showLoadingMore() => emit(state.loadingMore());

  void _hideLoadingMore() => emit(state.hideLoadingMore());

  void switchDisplayType() {
    if (state.displayType == DisplayType.list) {
      emit(state.copyWith(displayType: DisplayType.grid));
    } else {
      emit(state.copyWith(displayType: DisplayType.list));
    }
  }

  bool isAllowLoadMore() {
    if (state.isLoadMore) {
      return false;
    }
    if (state.page == state.totalPages) {
      return false;
    }
    return true;
  }
}
