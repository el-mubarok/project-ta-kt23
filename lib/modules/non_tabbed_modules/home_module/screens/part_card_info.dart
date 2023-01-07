import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';

class PartCardInfo extends StatefulWidget {
  const PartCardInfo({super.key});

  @override
  State<StatefulWidget> createState() => _PartCardInfo();
}

class _PartCardInfo extends State<PartCardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _Item(
              title: "20x",
              subtitle: "Present",
            ),
            VerticalDivider(
              color: AppColors.quartenary,
            ),
            //
            _Item(
              title: "2x",
              subtitle: "Late",
            ),
            VerticalDivider(
              color: AppColors.quartenary,
            ),
            //
            _Item(
              title: "1x",
              subtitle: "Unpresent",
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        //
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
