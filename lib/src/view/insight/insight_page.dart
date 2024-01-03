import 'package:flutter/material.dart';
import 'package:owow_admin/src/view/common/background.dart';

class InsightPage extends StatefulWidget {
  const InsightPage({super.key});

  @override
  State<InsightPage> createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
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
        'assets/images/insight.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
