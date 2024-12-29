import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NeumorphicButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final bool isLoading;

  const NeumorphicButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = 200,
    this.height = 50,
    this.isLoading = false,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTapDown: isEnabled ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: isEnabled ? (_) {
          setState(() => _isPressed = false);
          widget.onPressed?.call();
        } : null,
        onTapCancel: isEnabled ? () => setState(() => _isPressed = false) : null,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15),
            boxShadow: _isPressed
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.1),
                      offset: const Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
          ),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : widget.child,
          ),
        ).animate()
          .scale(
            duration: const Duration(milliseconds: 150),
            begin: const Offset(1, 1),
            end: Offset(_isPressed ? 0.95 : 1, _isPressed ? 0.95 : 1),
          ),
      ),
    );
  }
}
