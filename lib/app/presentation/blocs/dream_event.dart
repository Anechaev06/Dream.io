import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';

abstract class DreamEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadDreamsEvent extends DreamEvent {}

class AddDreamEvent extends DreamEvent {
  final Dream dream;

  AddDreamEvent(this.dream);

  @override
  List<Object> get props => [dream];
}

class UpdateDreamEvent extends DreamEvent {
  final Dream dream;

  UpdateDreamEvent(this.dream);

  @override
  List<Object> get props => [dream];
}

class DeleteDreamEvent extends DreamEvent {
  final String dreamId;

  DeleteDreamEvent(this.dreamId);

  @override
  List<Object> get props => [dreamId];
}
