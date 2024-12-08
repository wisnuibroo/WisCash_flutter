import 'package:flutter/material.dart';

class InboxMenu extends StatefulWidget {
  const InboxMenu({super.key});

  @override
  State<InboxMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<InboxMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}