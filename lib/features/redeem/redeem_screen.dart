import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final rewards = const [
      ('Eco Tote Bag', 10),
      ('₱50 Voucher', 15),
      ('Reusable Cup', 20),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Redeem Points')),
      body: ListView.builder(
        itemCount: rewards.length,
        itemBuilder: (_, i) {
          final (name, cost) = rewards[i];
          final can = app.points >= cost;
          return ListTile(
            title: Text(name),
            trailing: FilledButton(
              onPressed: can ? () {
                app.redeem(cost);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Redeemed $name (-$cost pts)')));
              } : null,
              child: Text('$cost pts'),
            ),
          );
        },
      ),
    );
  }
}
