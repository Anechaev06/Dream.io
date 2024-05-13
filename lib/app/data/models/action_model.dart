import 'package:hive/hive.dart';
import '../../domain/domain.dart';

part 'action_model.g.dart';

@HiveType(typeId: 1)
class ActionModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String dreamId;
  @HiveField(2)
  String description;
  @HiveField(3)
  bool isCompleted;

  ActionModel({
    required this.id,
    required this.dreamId,
    required this.description,
    this.isCompleted = false,
  });

  factory ActionModel.fromEntity(Action action) {
    return ActionModel(
      id: action.id,
      dreamId: action.dreamId,
      description: action.description,
      isCompleted: action.isCompleted,
    );
  }

  Action toEntity() {
    return Action(
      id: id,
      dreamId: dreamId,
      description: description,
      isCompleted: isCompleted,
    );
  }

  ActionModel copyWith({
    String? id,
    String? dreamId,
    String? description,
    bool? isCompleted,
  }) {
    return ActionModel(
      id: id ?? this.id,
      dreamId: dreamId ?? this.dreamId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
