import '../domain.dart';

class AddDream {
  final DreamRepository repository;

  AddDream(this.repository);

  Future<void> call(Dream dream) async {
    await repository.addDream(dream);
  }
}
