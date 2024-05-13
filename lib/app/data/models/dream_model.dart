import 'package:hive/hive.dart';
import '../../domain/domain.dart';
import '../data.dart';

part 'dream_model.g.dart';

@HiveType(typeId: 0)
class DreamModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  List<ActionModel> actions;

  DreamModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    this.actions = const [],
  });

  factory DreamModel.fromEntity(Dream dream) {
    return DreamModel(
      id: dream.id,
      title: dream.title,
      description: dream.description,
      date: dream.date,
    );
  }

  Dream toEntity() {
    return Dream(
      id: id,
      title: title,
      description: description,
      date: date,
    );
  }
}
