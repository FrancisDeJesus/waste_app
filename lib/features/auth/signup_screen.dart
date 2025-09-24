import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../state/app_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration deco(String label) => InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      isDense: true,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F8),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Form(
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // logo + brand
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/eagle_black.png', height: 22),
                          const SizedBox(width: 8),
                          const Text('DARWCOS',
                              style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF2E7D32))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text('Get Started',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontWeight: FontWeight.bold, color: const Color(0xFF2E7D32))),
                      const SizedBox(height: 4),
                      const Text('Enter your details to start your journey with us.',
                          style: TextStyle(color: Colors.black54)),

                      const SizedBox(height: 20),
                      TextFormField(controller: _name, decoration: deco('Full Name'),
                          validator: (v) => v!.isEmpty ? 'Required' : null),
                      const SizedBox(height: 12),
                      TextFormField(controller: _email, decoration: deco('Email'),
                          validator: (v) => v!.contains('@') ? null : 'Enter valid email'),
                      const SizedBox(height: 12),
                      TextFormField(controller: _pass, obscureText: true,
                          decoration: deco('Password'),
                          validator: (v) => v!.length < 6 ? 'Min 6 characters' : null),

                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: FilledButton(
                          onPressed: _busy ? null : () async {
                            if (!_form.currentState!.validate()) return;
                            setState(() => _busy = true);

                            // save to app state so "Hello ___!" shows the real name
                            context.read<AppState>().register(
                              n: _name.text.trim(),
                              r: '',        // (optional for now)
                              a: '',        // (optional for now)
                            );

                            await Future.delayed(const Duration(milliseconds: 400)); // demo delay
                            if (!mounted) return;
                            context.go('/dashboard'); // land on the User dashboard
                          },
                          child: _busy
                              ? const CircularProgressIndicator()
                              : const Text('Sign Up'),
                        ),
                      ),

                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),

                      _SocialBtn(text: 'Sign up with Google', icon: Icons.g_mobiledata, onTap: () {}),
                      const SizedBox(height: 8),
                      _SocialBtn(text: 'Sign up with Apple', icon: Icons.apple, onTap: () {}),

                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an Account? ',
                              style: TextStyle(color: Colors.black54)),
                          InkWell(
                            onTap: () => context.go('/signin'), // go to SignIn
                            child: const Text('Sign in',
                                style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2E7D32))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(44),
        side: const BorderSide(color: Colors.black26),
      ),
    );
  }
}
