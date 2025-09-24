import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class SchedulePickupScreen extends StatefulWidget {
  const SchedulePickupScreen({super.key});
  @override State<SchedulePickupScreen> createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  DateTime? when;

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Select Time of Pick Up')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(when == null ? 'Choose date & time' : when.toString()),
              trailing: const Icon(Icons.calendar_month),
              onTap: () async {
                final d = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 30)), initialDate: DateTime.now());
                if (d == null) return;
                final t = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (t == null) return;
                setState(() => when = DateTime(d.year, d.month, d.day, t.hour, t.minute));
              },
            ),
            const Spacer(),
            FilledButton(
              onPressed: when == null ? null : () {
                app.setSchedule(when!);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pickup scheduled (demo). +5 pts')));
                Navigator.pop(context); // back to dashboard
              },
              child: const Text('Confirm Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
