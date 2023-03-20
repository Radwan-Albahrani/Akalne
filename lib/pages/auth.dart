import 'package:flutter/material.dart';

// Page to regester a new account, for both reciepent and restaurant.
class RegesterPage extends StatefulWidget {
  const RegesterPage({super.key, required this.title});

  final String title;

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// Page to login to an existing account.
class LogInPage extends StatefulWidget {
  const LogInPage({super.key, required this.title});

  final String title;

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
