import 'package:flutter/material.dart';

import '../../core/design/colors.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  const LinearProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      backgroundColor: TEAL,
      valueColor: AlwaysStoppedAnimation<Color>(GREEN),
    );
  }
}
