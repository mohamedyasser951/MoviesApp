import 'package:flutter/widgets.dart';

class HorizontalBuilder extends StatelessWidget {
  final Widget widget;
  const HorizontalBuilder({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return widget;
        },
      ),
    );
  }
}
