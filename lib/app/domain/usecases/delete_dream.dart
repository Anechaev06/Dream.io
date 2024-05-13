import '../domain.dart';

class DeleteDream {
  final DreamRepository repository;

  DeleteDream(this.repository);

  Future<void> call(String dreamId) async {
    await repository.deleteDream(dreamId);
  }
}
