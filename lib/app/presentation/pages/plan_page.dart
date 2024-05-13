import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation.dart';
import '../../domain/entities/action.dart' as app_action;

class PlanPage extends StatelessWidget {
  final String dreamId;

  const PlanPage({super.key, required this.dreamId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan for Dream'),
      ),
      body: BlocBuilder<ActionBloc, ActionState>(
        builder: (context, state) {
          if (state is ActionLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ActionsLoaded) {
            return ActionList(actions: state.actions);
          } else if (state is ActionError) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddActionDialog(context, dreamId),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddActionDialog(BuildContext context, String dreamId) {
    String actionDescription = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Action'),
          content: TextField(
            onChanged: (value) {
              actionDescription = value;
            },
            decoration: const InputDecoration(hintText: "Action Description"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newAction = app_action.Action(
                  id: DateTime.now().toString(),
                  dreamId: dreamId,
                  description: actionDescription,
                );
                context.read<ActionBloc>().add(AddActionEvent(newAction));
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
