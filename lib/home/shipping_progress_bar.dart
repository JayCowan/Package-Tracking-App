import 'dart:async';

import 'package:flutter/material.dart';

class ShippingProgressBar extends StatefulWidget {
  final double progress;
  final int endValue;
  const ShippingProgressBar(
      {Key? key, required this.progress, required this.endValue})
      : super(key: key);

  @override
  _ShippingProgressBarState createState() => _ShippingProgressBarState();
}

class _ShippingProgressBarState extends State<ShippingProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      upperBound: widget.progress,
    )..addListener(() {
        setState(() {});
      });
    _controller.forward();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 25,
      width: MediaQuery.of(context).size.width / 5,
      child: ListView.builder(
        itemCount: widget.endValue,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              SizedBox.shrink(
                child: LinearProgressIndicator(
                  value: _controller.value,
                  color: Colors.green,
                  backgroundColor: Theme.of(context).backgroundColor,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
