import '../domain.dart';

class UpdateDream {
  final DreamRepository repository;

  UpdateDream(this.repository);

  Future<void> call(Dream dream) async {
    await repository.updateDream(dream);
  }
}
