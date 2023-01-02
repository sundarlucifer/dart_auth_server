abstract class CustomError extends Error {
  final String description;

  CustomError(this.description);

  @override
  String toString() => description;
}

class UserAlreadyExistsError extends CustomError {
  UserAlreadyExistsError() : super('UserAlreadyExist');
}
