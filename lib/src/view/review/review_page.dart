import 'package:flutter/material.dart';

import '../common/background.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: Center(
          child: _rightLayout(context),
        ),
      ),
    );
  }

  Widget _rightLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 700,
        maxWidth: 900,
        minHeight: 500,
        minWidth: 500,
      ),
      child: Image.asset(
        'assets/images/review.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
