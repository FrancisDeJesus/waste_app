import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../state/app_state.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _resto = TextEditingController();
  final _addr = TextEditingController();

  @override void dispose(){ _name.dispose(); _resto.dispose(); _addr.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Create your account', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            TextFormField(controller: _name, decoration: const InputDecoration(labelText:'Full name'), validator:(v)=>v!.isEmpty?'Required':null),
            TextFormField(controller: _resto, decoration: const InputDecoration(labelText:'Restaurant name'), validator:(v)=>v!.isEmpty?'Required':null),
            TextFormField(controller: _addr, decoration: const InputDecoration(labelText:'Address'), validator:(v)=>v!.isEmpty?'Required':null),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: (){
                if(!_form.currentState!.validate()) return;
                context.read<AppState>().register(n:_name.text, r:_resto.text, a:_addr.text);
                context.go('/dashboard');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
