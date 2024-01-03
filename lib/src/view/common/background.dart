import 'package:flutter/material.dart';
import 'package:owow_admin/src/core/constants/gap_constant.dart';
import 'package:owow_admin/src/core/extensions/responsive_framwork.dart';
import 'package:responsive_framework/max_width_box.dart';

import '../../core/constants/size_constant.dart';

class HomeBackground extends StatelessWidget {
  final Widget child;

  const HomeBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child:
          context.isDisplayLargeThanTablet ? _child(context) : _error(context),
    );
  }

  Widget _child(BuildContext context) {
    var color = Colors.transparent;

    return Container(
      color: color,
      child: Align(
        alignment: Alignment.topCenter,
        child: MaxWidthBox(
          maxWidth: MaxSizeConstant.maxWidth,
          child: child,
        ),
      ),
    );
  }

  Widget _error(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Error',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 24.0,
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
          ),
          GapConstant.h20,
          Text(
            'The page you are looking for will only open on larger screen.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          GapConstant.h20,
        ],
      ),
    );
  }
}
