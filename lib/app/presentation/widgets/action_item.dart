import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../presentation.dart';
import '../../domain/entities/action.dart' as app_action;

class ActionItem extends StatelessWidget {
  final app_action.Action action;

  const ActionItem({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(action.id),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Handle edit
            },
            backgroundColor: Colors.blue,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (context) {
              context.read<ActionBloc>().add(DeleteActionEvent(action.id));
            },
            backgroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Text(action.description),
        trailing: Checkbox(
          value: action.isCompleted,
          onChanged: (value) {
            context.read<ActionBloc>().add(UpdateActionEvent(
                  action.copyWith(isCompleted: value!),
                ));
          },
        ),
      ),
    );
  }
}
