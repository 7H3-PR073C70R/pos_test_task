import 'package:flutter/material.dart';

class ShrinkableButton extends StatefulWidget {
  const ShrinkableButton({
    required this.child,
    required this.onTap,
    super.key,
  });
  final Widget child;
  final VoidCallback? onTap;

  @override
  State<ShrinkableButton> createState() => _ShrinkableButtonState();
}

class _ShrinkableButtonState extends State<ShrinkableButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      value: 1,
      lowerBound: .91,
    );
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (_) {
        if (widget.onTap == null) return;
        _controller.forward();
      },
      onTapCancel: () {
        if (widget.onTap == null) return;
        _controller.forward();
      },
      onTap: () {
        if (widget.onTap == null) return;
        Future.delayed(Duration.zero, () {
          _controller.reverse().then((value) {
            widget.onTap?.call();
            _controller.forward();
          });
        });
      },
      child: Transform.scale(
        scale: _curvedAnimation.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
