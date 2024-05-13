import 'package:equatable/equatable.dart';

class Action extends Equatable {
  final String id;
  final String dreamId;
  final String description;
  final bool isCompleted;

  const Action({
    required this.id,
    required this.dreamId,
    required this.description,
    this.isCompleted = false,
  });

  @override
  List<Object> get props => [id, dreamId, description, isCompleted];

  Action copyWith({
    String? id,
    String? dreamId,
    String? description,
    bool? isCompleted,
  }) {
    return Action(
      id: id ?? this.id,
      dreamId: dreamId ?? this.dreamId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
