import 'package:attendanceapp/modules/non_tabbed_modules/home_module/bloc/home_bloc.dart';
import 'package:attendanceapp/shared/models/shared_user_attendance_all_model.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PartCardInfo extends StatefulWidget {
  const PartCardInfo({super.key});

  @override
  State<StatefulWidget> createState() => _PartCardInfo();
}

class _PartCardInfo extends State<PartCardInfo> {
  SharedUserAttendanceAll? userAttendanceSummary;
  String? presentOnTime = '0';
  String? presentLate = '0';
  String? notPresent = '0';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeStateLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is HomeStateDataLoaded) {
          setState(() {
            isLoading = false;
            userAttendanceSummary = state.userAttendanceSummary;

            if (userAttendanceSummary != null) {
              if (userAttendanceSummary!.data.isNotEmpty) {
                presentOnTime = userAttendanceSummary != null
                    ? userAttendanceSummary?.data[0].presentOnTime.toString()
                    : '0';
                presentLate = userAttendanceSummary != null
                    ? userAttendanceSummary?.data[0].presentLate.toString()
                    : '0';
                notPresent = userAttendanceSummary != null
                    ? userAttendanceSummary?.data[0].notPresent.toString()
                    : '0';
              }
            }
          });
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 24,
            left: 18,
            right: 18,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Text(
                  "Recap for this month: ${DateFormat('MM/dd/y').format(DateTime.now())}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              //
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _Item(
                      title: isLoading ? "..." : "${presentOnTime}x",
                      subtitle: "Present",
                    ),
                    const VerticalDivider(
                      color: AppColors.quartenary,
                    ),
                    //
                    _Item(
                      title: isLoading ? "..." : "${presentLate}x",
                      subtitle: "Late",
                    ),
                    const VerticalDivider(
                      color: AppColors.quartenary,
                    ),
                    //
                    _Item(
                      title: isLoading ? "..." : "${notPresent}x",
                      subtitle: "Unpresent",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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
