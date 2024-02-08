import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  //
                },
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  //
                },
                child: Icon(
                  Icons.settings_outlined,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
