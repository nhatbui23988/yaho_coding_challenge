

class AppError{
  final int errorCode;
  final String errorMsg;
  AppError(this.errorCode, this.errorMsg);

  AppError.unknownError() : this(-1, "An error has occurred");
}