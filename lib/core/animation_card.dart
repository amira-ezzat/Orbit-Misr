
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 🟢 Widget خاص باللوجو + أنيميشن
class AnimatedLogoCard extends StatefulWidget {
  final String imagePath;
  const AnimatedLogoCard({required this.imagePath});

  @override
  State<AnimatedLogoCard> createState() => _AnimatedLogoCardState();
}

class _AnimatedLogoCardState extends State<AnimatedLogoCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(_hovering ? 1.05 : 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), // حواف أنعم
          border: Border.all(
            color: Colors.grey.shade300, // إطار خفيف عشان يبان الكارد على الرمادي
            width: 1,
          ),
          boxShadow: _hovering
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            )
          ]
              : [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
