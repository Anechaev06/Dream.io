import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

abstract class DreamState extends Equatable {
  @override
  List<Object> get props => [];
}

class DreamInitial extends DreamState {}

class DreamLoading extends DreamState {}

class DreamsLoaded extends DreamState {
  final List<Dream> dreams;

  DreamsLoaded(this.dreams);

  @override
  List<Object> get props => [dreams];
}

class DreamError extends DreamState {
  final String message;

  DreamError(this.message);

  @override
  List<Object> get props => [message];
}
