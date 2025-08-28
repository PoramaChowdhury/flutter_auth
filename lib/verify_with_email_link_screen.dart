import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/welcome_screen.dart';

class VerifyWithEmailLinkScreen extends StatefulWidget {
  const VerifyWithEmailLinkScreen({super.key});

  @override
  State<VerifyWithEmailLinkScreen> createState() =>
      _VerifyWithEmailLinkScreenState();
}

class _VerifyWithEmailLinkScreenState
    extends State<VerifyWithEmailLinkScreen> {
  bool _isVerified = false;

  @override
  void initState() {
    super.initState();
    _checkVerification();
  }

  Future<void> _checkVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      _isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isVerified) {
      return const WelcomeScreen();
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mark_email_read_outlined,
                  size: 80, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text("Verify Your Email",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              const Text(
                "We have sent a verification link to your email. Please verify before continuing.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _checkVerification,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("I've verified"),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.currentUser!.sendEmailVerification();
                },
                child: const Text("Resend Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
