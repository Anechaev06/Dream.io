import 'package:flutter/material.dart';
import '../presentation.dart';
import '../../domain/entities/action.dart' as app_action;

class ActionList extends StatelessWidget {
  final List<app_action.Action> actions;

  const ActionList({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return ActionItem(action: action);
      },
    );
  }
}
