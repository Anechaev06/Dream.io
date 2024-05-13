import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class DreamList extends StatelessWidget {
  final List<Dream> dreams;

  const DreamList({super.key, required this.dreams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dreams.length,
      itemBuilder: (context, index) {
        final dream = dreams[index];
        return Slidable(
          key: Key(dream.id),
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
                  context.read<DreamBloc>().add(DeleteDreamEvent(dream.id));
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: DreamItem(
            dream: dream,
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.planPage,
                arguments: {'dreamId': dream.id},
              );
            },
          ),
        );
      },
    );
  }
}
