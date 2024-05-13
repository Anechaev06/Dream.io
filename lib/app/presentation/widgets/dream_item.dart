import 'package:flutter/material.dart';
import '../../domain/domain.dart';

class DreamItem extends StatelessWidget {
  final Dream dream;
  final VoidCallback? onTap;

  const DreamItem({super.key, required this.dream, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dream.title),
      subtitle: Text(dream.description),
      onTap: onTap,
    );
  }
}
