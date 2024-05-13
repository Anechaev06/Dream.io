import '../domain.dart';

class AddAction {
  final DreamRepository repository;

  AddAction(this.repository);

  Future<void> call(Action action) async {
    // This function should be implemented in the repository.
    await repository.addAction(action);
  }
}
