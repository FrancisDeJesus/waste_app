import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class SelectWasteScreen extends StatefulWidget {
  const SelectWasteScreen({super.key});
  @override State<SelectWasteScreen> createState() => _SelectWasteScreenState();
}

class _SelectWasteScreenState extends State<SelectWasteScreen> {
  WasteType? _type;
  bool _recyclables = false;

  @override
  Widget build(BuildContext context) {
    final labels = {
      WasteType.customer: 'Customer Food Waste',
      WasteType.kitchen:  'Kitchen Waste',
      WasteType.service:  'Food Service Waste',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('Select Type of Waste')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            onPressed: _type == null ? null : () {
              context.read<AppState>().setWaste(_type!, _recyclables);
              context.push('/pickup/schedule');
            },
            child: const Text('Next: Schedule'),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final e in labels.entries)
            RadioListTile<WasteType>(
              value: e.key,
              groupValue: _type,
              onChanged: (v) => setState(() => _type = v),
              title: Text(e.value),
            ),
          const Divider(),
          CheckboxListTile(
            value: _recyclables,
            onChanged: (v) => setState(() => _recyclables = v ?? false),
            title: const Text('Includes glass/plastics?'),
          ),
        ],
      ),
    );
  }
}
