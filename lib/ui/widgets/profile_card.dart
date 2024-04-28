import 'package:flutter/material.dart';

class CardProfileWidget extends StatelessWidget {
  final Icon leading;
  final String title;
  final Icon trailing;
  final Function() action;
  const CardProfileWidget({super.key, required this.leading, required this.title, required this.trailing, required this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF232239),
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}