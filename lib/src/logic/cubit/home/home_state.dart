import 'package:yaho_coding_challenge/src/data/model/base/app_error.dart';
import 'package:yaho_coding_challenge/src/data/model/base/paging_response.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';

enum DisplayType { list, grid }

class HomeState {
  final List<UserInformation> listUserInformation;
  final bool isLoading;
  final bool isLoadMore;
  final int page;
  final int perPages;
  final int totalPages;
  final int total;
  final DisplayType displayType;
  final AppError? appError;

  HomeState(this.listUserInformation,
      {this.isLoading = false,
      this.isLoadMore = false,
      this.displayType = DisplayType.list,
      this.page = 0,
      this.total = 0,
      this.perPages = 0,
      this.totalPages = 0,
      this.appError});

  HomeState.initialState() : this([], isLoading: true);

  HomeState.displayData(Paging<UserInformation> nextPaging)
      : this(nextPaging.data ?? [],
            page: nextPaging.page ?? 0,
            perPages: nextPaging.perPage ?? 0,
            totalPages: nextPaging.totalPages ?? 0,
            total: nextPaging.total ?? 0);

  // factory HomeState.addNewResult(
  //     Paging<UserInformation> nextPaging, List<UserInformation> currentList) {
  //   final newList = List<UserInformation>.from(currentList);
  //   final nextPagingList = nextPaging.data;
  //   if (nextPagingList != null) {
  //     newList.addAll(nextPagingList);
  //   }
  //   return HomeState(newList,
  //       page: nextPaging.page ?? 0,
  //       perPages: nextPaging.perPage ?? 0,
  //       totalPages: nextPaging.totalPages ?? 0,
  //       total: nextPaging.total ?? 0);
  // }

  HomeState copyWith({
    List<UserInformation>? listUserInformation,
    bool? isLoading,
    bool? isLoadMore,
    DisplayType? displayType,
    int? page,
    int? perPages,
    int? totalPages,
    int? total,
    AppError? appError,
  }) {
    return HomeState(
      listUserInformation ?? this.listUserInformation,
      isLoading: isLoading ?? this.isLoading,
      isLoadMore: isLoadMore ?? this.isLoadMore,
      displayType: displayType ?? this.displayType,
      page: page ?? this.page,
      perPages: perPages ?? this.perPages,
      totalPages: totalPages ?? this.totalPages,
      total: total ?? this.total,
      appError: appError ?? this.appError,
    );
  }
}

extension HomeStateX on HomeState {
  HomeState loadingMore() {
    return copyWith(
        listUserInformation: [...listUserInformation, LoadingMore()],
        isLoadMore: true);
  }

  HomeState hideLoadingMore() {
    return copyWith(
        listUserInformation:
            listUserInformation.sublist(0, listUserInformation.length - 2),
        isLoadMore: true);
  }

  HomeState addNewResult(     Paging<UserInformation> nextPaging){
    final newList = [...listUserInformation];
    final nextPagingList = nextPaging.data;
    if (nextPagingList != null) {
      newList.addAll(nextPagingList);
    }
    return copyWith(listUserInformation: newList,
        page: nextPaging.page ?? 0,
        perPages: nextPaging.perPage ?? 0,
        totalPages: nextPaging.totalPages ?? 0,
        total: nextPaging.total ?? 0);
  }
}
