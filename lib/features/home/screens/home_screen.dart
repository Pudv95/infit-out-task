import 'package:flutter/material.dart';
import 'package:scrollplus/features/home/widgets/custom_scrollable_table.dart';

/// The home screen of the application.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Scrollable Table'),
        ),
        body: const CustomScrollableTable());
  }
}
