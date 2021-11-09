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
      upperBound: widget.endValue.toDouble(),
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

  Stack _getProgressIconStack(int index) {
    if (_controller.value - index >= 1) {
      return Stack(alignment: Alignment.center, children: [
        Positioned(
          left: 0,
          height: MediaQuery.of(context).size.height / 50,
          width: index == 0 ? 0 : MediaQuery.of(context).size.width / 25,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border(
                top: BorderSide(color: Colors.grey.shade700),
                bottom: BorderSide(color: Colors.grey.shade700),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          height: MediaQuery.of(context).size.height / 50,
          width: index == widget.endValue - 1
              ? 0
              : MediaQuery.of(context).size.width / 25,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border(
                top: BorderSide(color: Colors.grey.shade700),
                bottom: BorderSide(color: Colors.grey.shade700),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          decoration: ShapeDecoration(
              color: Colors.green,
              shape:
                  CircleBorder(side: BorderSide(color: Colors.grey.shade700))),
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 18.0,
            ),
          ),
        ),
      ]);
    } else {
      return Stack(alignment: Alignment.center, children: [
        Positioned(
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              border: Border(
                top: BorderSide(color: Colors.grey.shade700),
                bottom: BorderSide(color: Colors.grey.shade700),
              ),
            ),
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            shape: CircleBorder(
              side: BorderSide(color: Colors.grey.shade700),
            ),
          ),
          child: Container(
            decoration: ShapeDecoration(
                color: Theme.of(context).backgroundColor,
                shape: CircleBorder(
                    side: BorderSide(color: Colors.grey.shade700))),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.place,
                color: Colors.grey.shade700,
                size: 18.0,
              ),
            ),
          ),
        ),
      ]);
    }
  }

  Container _deliveryStartedWidget(progress) {
    if (progress == 0) {
      return Container(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade700),
                    bottom: BorderSide(color: Colors.grey.shade700),
                  ),
                ),
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                shape: CircleBorder(
                  side: BorderSide(color: Colors.grey.shade700),
                ),
              ),
              child: Icon(
                Icons.place,
                color: Colors.grey.shade700,
                size: 18.0,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 0,
              height: MediaQuery.of(context).size.height / 50,
              width: MediaQuery.of(context).size.width / 25,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade700),
                    bottom: BorderSide(color: Colors.grey.shade700),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              decoration: ShapeDecoration(
                color: Colors.green,
                shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        itemCount: widget.endValue,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (index == 0
                    ? _deliveryStartedWidget(widget.progress)
                    : Container()),
                Flexible(
                  child: SizedBox.fromSize(
                    size: Size(MediaQuery.of(context).size.width / 25,
                        MediaQuery.of(context).size.height / 50),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade700),
                          bottom: BorderSide(color: Colors.grey.shade700),
                        ),
                      ),
                      child: LinearProgressIndicator(
                        value: _controller.value - index,
                        color: Colors.green,
                        backgroundColor: Theme.of(context).backgroundColor,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  ),
                ),
                Flexible(child: _getProgressIconStack(index))
              ],
            ),
          );
        },
      ),
    );
  }
}
