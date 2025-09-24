import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pts = context.watch<AppState>().points;
    return Scaffold(
      appBar: AppBar(title: const Text('Points')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$pts', style: Theme.of(context).textTheme.displaySmall),
            const Text('points balance'),
          ],
        ),
      ),
    );
  }
}
