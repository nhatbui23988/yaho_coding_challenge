

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yaho_coding_challenge/src/data/model/base/paging_response.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';
part 'app_services.g.dart';
@RestApi(baseUrl: "https://reqres.in/api")
abstract class AppServices {
  factory AppServices(Dio dio, {String baseUrl}) = _AppServices;

  @GET("/users")
  Future<PagingResponse<UserInformation>> getUserPage(@Query("page") int page);
}