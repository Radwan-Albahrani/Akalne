import 'package:flutter/material.dart';
import 'package:switch_up/switch_up.dart';

import '../../../../../theme/app_colors.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key, required this.onChanged, required this.items});
  final dynamic Function(dynamic) onChanged;
  final List items;

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.light['background'],
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: AppColors.light['primary'],
        ),
      ),
      child: SwitchUp(
        backgroundColor: Colors.transparent,
        color: AppColors.light['primary'],
        radius: 50,
        height: 50,
        curves: Curves.easeInOutBack,
        items: widget.items,
        onChanged: widget.onChanged,
        value: widget.items[0],
      ),
    );
  }
}
