import 'package:flutter/material.dart';

class CutomInpuDataText extends StatelessWidget {
  CutomInpuDataText({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10),
      child: Row(
        children: [
          Text(
            text!,
            style: const TextStyle(
              color: Color(0xFFF8A00E),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
