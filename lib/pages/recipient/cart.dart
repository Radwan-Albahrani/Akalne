import 'package:flutter/material.dart';

// Page to view all items in the system, to be able to select.
class ItemsBrowserPage extends StatefulWidget {
  const ItemsBrowserPage({super.key, required this.title});

  final String title;

  @override
  State<ItemsBrowserPage> createState() => _ItemsBrowserPageState();
}

class _ItemsBrowserPageState extends State<ItemsBrowserPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
