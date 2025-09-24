import 'package:flutter/material.dart';
import '../../theme.dart';

class AppCardTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? trailingChip;
  final VoidCallback? onTap;

  const AppCardTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailingChip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppTokens.r20),
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppTokens.pad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTokens.iconBubble,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Icon(icon, color: Colors.black54),
                ),
                const Spacer(),
                if (trailingChip != null)
                  Chip(label: Text(trailingChip!), visualDensity: VisualDensity.compact),
              ]),
              const Spacer(),
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppTokens.text)),
              if (subtitle != null)
                Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
