import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';

abstract class ActionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadActionsEvent extends ActionEvent {
  final String dreamId;

  LoadActionsEvent(this.dreamId);

  @override
  List<Object> get props => [dreamId];
}

class AddActionEvent extends ActionEvent {
  final Action action;

  AddActionEvent(this.action);

  @override
  List<Object> get props => [action];
}

class UpdateActionEvent extends ActionEvent {
  final Action action;

  UpdateActionEvent(this.action);

  @override
  List<Object> get props => [action];
}

class DeleteActionEvent extends ActionEvent {
  final String actionId;

  DeleteActionEvent(this.actionId);

  @override
  List<Object> get props => [actionId];
}
