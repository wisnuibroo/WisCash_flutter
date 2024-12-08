import 'package:flutter/material.dart';

class FinanceMenu extends StatefulWidget {
  const FinanceMenu({super.key});

  @override
  State<FinanceMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FinanceMenu>
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