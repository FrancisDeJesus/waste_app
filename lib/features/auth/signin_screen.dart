import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass  = TextEditingController();
  bool _busy = false;

  @override
  void dispose() { _email.dispose(); _pass.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    Widget leftWelcome() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Eagle mark
                Image.asset('assets/images/eagle_black.png', height: 84),
                const SizedBox(height: 28),
                Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
                    children: const [
                      TextSpan(text: 'Welcome to '),
                      TextSpan(text: 'DARWCOS', style: TextStyle(color: Color(0xFF2E7D32))),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'The next step to Redefining\nRestaurant Waste Collection',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black54, height: 1.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    InputDecoration deco(String label) => InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      isDense: true,
    );

    Widget rightForm() => Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
        child: Form(
          key: _form,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top mini logo + wordmark
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/eagle_logo.png', height: 20),
                    const SizedBox(width: 8),
                    const Text('DARWCOS', style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: .5)),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Welcome Back!', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(
                  "Let's continue in making the world a better place one step at a time.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.black54),
                ),

                const SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  decoration: deco('Email'),
                  validator: (v) => v != null && v.contains('@') ? null : 'Enter a valid email',
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _pass,
                  obscureText: true,
                  decoration: deco('Password'),
                  validator: (v) => v != null && v.length >= 6 ? null : 'Min 6 characters',
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {}, // demo only
                    child: const Text('Forgot Password?'),
                  ),
                ),

                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: FilledButton(
                    onPressed: _busy ? null : () async {
                      if (!_form.currentState!.validate()) return;
                      setState(() => _busy = true);
                      await Future.delayed(const Duration(milliseconds: 600)); // demo
                      if (mounted) context.go('/dashboard'); // route to dashboard on demo sign-in
                    },
                    child: _busy ? const CircularProgressIndicator() : const Text('Sign In'),
                  ),
                ),

                const SizedBox(height: 18),
                const Row(children: [
                  Expanded(child: Divider()), SizedBox(width: 8),
                  Text('or', style: TextStyle(color: Colors.black54)),
                  SizedBox(width: 8), Expanded(child: Divider()),
                ]),
                const SizedBox(height: 12),

                _SocialBtn(text: 'Sign in with Google', icon: Icons.g_mobiledata, onTap: (){}),
                const SizedBox(height: 8),
                _SocialBtn(text: 'Sign in with Apple', icon: Icons.apple, onTap: (){}),

                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('New User?  ', style: TextStyle(color: Colors.black54)),
                    InkWell(
                      onTap: () => context.go('/signup'), // go to SignUp
                      child: const Text('Sign up', style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F8),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(flex: 5, child: leftWelcome()),
                      const SizedBox(width: 20),
                      Expanded(flex: 5, child: rightForm()),
                    ],
                  )
                : ListView(
                    children: [
                      leftWelcome(),
                      const SizedBox(height: 12),
                      rightForm(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const _SocialBtn({required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap, icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(44)),
    );
  }
}
