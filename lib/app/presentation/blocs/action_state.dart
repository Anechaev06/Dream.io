import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

abstract class ActionState extends Equatable {
  @override
  List<Object> get props => [];
}

class ActionInitial extends ActionState {}

class ActionLoading extends ActionState {}

class ActionsLoaded extends ActionState {
  final List<Action> actions;

  ActionsLoaded(this.actions);

  @override
  List<Object> get props => [actions];
}

class ActionError extends ActionState {
  final String message;

  ActionError(this.message);

  @override
  List<Object> get props => [message];
}
