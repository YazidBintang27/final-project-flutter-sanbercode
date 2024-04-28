import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final bool? loading;
  final Function() action;
  const ButtonWidget({super.key, required this.text, required this.action, this.loading});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFF6443E8),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: widget.loading ?? false ? const CircularProgressIndicator(color: Colors.white,) : Text(
            widget.text,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
