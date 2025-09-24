import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 800;

    final title = RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              height: 1.1,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
        children: const [
          TextSpan(text: 'Radiate\n'),
          TextSpan(text: 'Pride', style: TextStyle(color: Color(0xFF2E7D32))),
          TextSpan(text: '.\nRadiate\n'),
          TextSpan(text: 'Cleanliness', style: TextStyle(color: Color(0xFF2E7D32))),
          TextSpan(text: '.'),
        ],
      ),
    );

    final signIn = FilledButton(
      onPressed: () => context.go('/signin'), // go to Sign In page
      child: const Text('Sign In'),
    );

    final signUp = TextButton(
      onPressed: () => context.go('/signup'), // go to SignUp page
      child: const Text('New User?  Sign up'),
    );

    Widget rightPanel() => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top eagle mark (black)
              Image.asset('assets/images/eagle_black.png', height: 96, fit: BoxFit.contain),
              const SizedBox(height: 24),
              title,
              const SizedBox(height: 24),
              signIn,
              const SizedBox(height: 8),
              signUp,
            ],
          ),
        );

    Widget leftPhoto() => ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/philippine_eagle.jpg',
            fit: BoxFit.cover,
          ),
        );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F8),
      appBar: AppBar(
        //title: const Text('Start Up Page'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Row(
                    children: [
                      // left image card
                      Expanded(
                        flex: 5,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: AspectRatio(
                            aspectRatio: 3/5,
                            child: leftPhoto(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // right panel card
                      Expanded(
                        flex: 4,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: rightPanel(),
                        ),
                      ),
                    ],
                  )
                : ListView(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: AspectRatio(aspectRatio: 16/9, child: leftPhoto()),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: rightPanel(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
