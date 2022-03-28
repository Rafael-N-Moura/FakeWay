import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  late final String message;

  @override
  List<Object?> get props => [];
}