import 'package:yaho_coding_challenge/src/data/datasource/app_services.dart';
import 'package:yaho_coding_challenge/src/data/model/base/app_error.dart';
import 'package:yaho_coding_challenge/src/data/model/base/paging_response.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';


class UserRepository {
  final AppServices appServices;

  UserRepository(this.appServices);

  Future<Paging<UserInformation>> getUserByPage(int page)  async {
      return appServices.getUserPage(page).then((value) {
      if(value.data != null){
        return value.data!;
      } else {
        throw AppError.unknownError();
      }
    }).catchError((onError){
      print(onError);
      throw AppError.unknownError();
    });
  }
}
