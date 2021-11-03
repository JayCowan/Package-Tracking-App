import 'package:flutter/material.dart';
import 'package:package_tracker_app/home/shipping_progress_bar.dart';

class ShippingDisplay extends StatefulWidget {
  const ShippingDisplay({Key? key}) : super(key: key);

  @override
  _ShippingDisplayState createState() => _ShippingDisplayState();
}

class _ShippingDisplayState extends State<ShippingDisplay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: const <Widget>[
          ShippingProgressBar(progress: 4, endValue: 5),
        ],
      ),
    );
  }
}
