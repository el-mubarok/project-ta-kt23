import 'package:attendanceapp/config/routes/route_names.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/history_module/bloc/history_bloc.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/history_module/data/history_repository.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/login_module/bloc/login_bloc.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/login_module/data/login_repository.dart';
import 'package:attendanceapp/shared/models/shared_user_attendance_month_model.dart';
import 'package:attendanceapp/shared/ui/widgets/widget_button.dart';
import 'package:attendanceapp/shared/ui/widgets/widget_input.dart';
import 'package:attendanceapp/shared/ui/wrappers/wrapper_page.dart';
import 'package:attendanceapp/shared/utils/helper/helper_common.dart';
import 'package:attendanceapp/shared/utils/helper/helper_storage.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';

class ModuleHistory extends StatefulWidget {
  const ModuleHistory({super.key});

  @override
  State<StatefulWidget> createState() => _ModuleHistory();
}

class _ModuleHistory extends State<ModuleHistory> {
  SharedUserAttendanceMonth? data;

  @override
  void initState() {
    super.initState();
  }

  String checkPresentState(
    String onTime,
    String onLate,
    String notPresent,
  ) {
    if (onTime == "1") {
      return "On Time";
    } else if (onLate == "1") {
      return "Late";
    } else if (notPresent == "1") {
      return "Not Present";
    } else {
      return "Not Present";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryBloc(
        repository: HistoryRepository(),
      )..add(
          const HistoryEventInitData(),
        ),
      child: BlocListener<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is HistoryStateLoading) {
          } else if (state is HistoryStateDataLoaded) {
            setState(() {
              data = state.userAttendanceSummary;
            });
          }
        },
        child: WrapperPage(
          scrollable: false,
          hasPadding: false,
          backgroundColor: AppColors.primary,
          child: Column(
            children: [
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                color: AppColors.primary,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(
                          context,
                          NamedRoute.moduleAccount,
                        );
                      },
                      child: const HeroIcon(
                        HeroIcons.xMark,
                        color: AppColors.quartenary,
                        size: 24,
                      ),
                    ),
                    //
                    const Expanded(
                      child: Center(
                        child: Text(
                          "My Attendance History",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: (data?.data?.length ?? 0) > 99 ? 2 : 1,
                            child: const Text(
                              "No.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: (data?.data?.length ?? 0) > 99 ? 4 : 5,
                            child: const Text(
                              "Date",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          //
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "Status",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          //
                          const Expanded(
                            flex: 3,
                            child: Text(
                              "Out",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                      ),
                      //
                      BlocBuilder<HistoryBloc, HistoryState>(
                        builder: (context, state) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data?.data?.length ?? 0,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(
                                  top: index != 0 ? 4 : 0,
                                ),
                                padding: EdgeInsets.only(
                                  top: index != 0 ? 4 : 0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: index != 0
                                        ? BorderSide(
                                            color: AppColors.white
                                                .withOpacity(0.15),
                                          )
                                        : BorderSide.none,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: index > 99 ? 2 : 1,
                                      child: Text(
                                        "${(index + 1).toString()}.",
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: index > 99 ? 4 : 5,
                                      child: Text(
                                        // "Sun, 20 Jan 2023",
                                        AppHelperCommon().dateFormatterHistory(
                                          data?.data![index]!.sessionDate,
                                        ),
                                        style: const TextStyle(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                    //
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        // "On Time",
                                        checkPresentState(
                                          data?.data![index]!.presentOnTime ??
                                              "0",
                                          data?.data![index]!.presentLate ??
                                              "0",
                                          data?.data![index]!.notPresent ?? "0",
                                        ),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                    //
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        // "20:00",
                                        AppHelperCommon().dateFormatterHistory(
                                          data?.data![index]!.presentOutAt,
                                          true,
                                        ),
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
