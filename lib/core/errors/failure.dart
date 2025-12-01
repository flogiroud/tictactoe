import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache failure', super.statusCode});
}

class ValidationFailure extends Failure {
  const ValidationFailure({
    super.message = 'Validation error',
    super.statusCode,
  });
}
