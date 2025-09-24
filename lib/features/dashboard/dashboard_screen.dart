import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';
import '../../common/widgets/app_card_tile.dart';
import '../../theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final name = app.name ?? 'User';
    final isWide = MediaQuery.of(context).size.width >= 900;
    final cross = isWide ? 3 : 2;

    final tiles = <Widget>[
      AppCardTile(
        icon: Icons.schedule,
        title: 'Schedule a Pick-Up',
        subtitle: 'Book date & time',
        onTap: () => context.push('/waste/select'),
      ),
      AppCardTile(
        icon: Icons.receipt_long,
        title: 'Past Transactions',
        subtitle: 'Pick-ups & points',
        onTap: () => context.push('/points'),
      ),
      AppCardTile(
        icon: Icons.card_giftcard,
        title: 'Rewards / Points',
        subtitle: 'Redeem rewards',
        trailingChip: '${app.points} pts',
        onTap: () => context.push('/redeem'),
      ),
    ];

    return Scaffold(
      backgroundColor: AppTokens.bg,

      // AppBar: avatar + green "Welcome, {name}" + points chip
      appBar: AppBar(
        backgroundColor: AppTokens.bg,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: AppTokens.iconBubble,
              child: const Icon(Icons.person, size: 18, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(
              'Welcome, $name',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTokens.primary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Chip(label: Text('${app.points} pts')),
          ),
        ],
      ),

      // Tiles
      body: Padding(
        padding: const EdgeInsets.all(AppTokens.pad),
        child: GridView.count(
          crossAxisCount: cross,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.25,
          children: tiles,
        ),
      ),

      // Bottom brand
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 44,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/eagle_black.png', height: 18),
              const SizedBox(width: 6),
              const Text(
                'DARWCOS',
                style: TextStyle(
                  color: AppTokens.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
