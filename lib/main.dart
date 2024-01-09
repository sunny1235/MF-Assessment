import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mf_assessment/screens/homesreen.dart';

void main() {
  runApp(const ProviderScope(child: FoundationApp()));
}

class FoundationApp extends StatelessWidget {
  const FoundationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
