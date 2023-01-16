import 'package:attendanceapp/config/assets.dart';
import 'package:attendanceapp/config/routes/route_names.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/bloc/home_bloc.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/data/home_repository.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/screens/part_card_info.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/screens/part_swiper.dart';
import 'package:attendanceapp/shared/models/shared_user_data_model.dart';
import 'package:attendanceapp/shared/ui/wrappers/wrapper_page.dart';
import 'package:attendanceapp/shared/utils/utils_global.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:attendanceapp/shared/utils/extension/extension_string_caiptalize.dart';

class ModuleHome extends StatefulWidget {
  const ModuleHome({super.key});

  @override
  State<StatefulWidget> createState() => _ModuleHome();
}

class _ModuleHome extends State<ModuleHome> {
  SharedUserData? userData;

  @override
  void initState() {
    userData = AppUtilsGlobal().userData.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        repository: HomeRepository(),
      )..add(HomeEventInitData()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {},
        child: WrapperPage(
          hasPadding: false,
          scrollable: false,
          statusBarColor: AppColors.quartenary,
          navigationBarColor: AppColors.primary,
          child: Container(
            color: AppColors.quartenary,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // menu
                        Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          color: AppColors.transparent,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    NamedRoute.moduleAccount,
                                  );
                                },
                                child: const HeroIcon(
                                  HeroIcons.bars3,
                                  color: AppColors.primary,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // avatar
                        Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(200),
                              ),
                              // child: Text("${userData?.data?.avatar}"),
                              // (userData?.data?.avatar)
                              //               .toString()
                              //               .isNotEmpty ||
                              //           userData?.data?.avatar != 'null'
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: userData?.data?.avatar != null
                                    ? Image.network(
                                        userData?.data?.avatar,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      )
                                    : Image.asset(
                                        AppAsset.emptyAvatar,
                                        fit: BoxFit.cover,
                                        isAntiAlias: true,
                                      ),
                              ),
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                              ),
                              child: Text(
                                (userData?.data?.fullName ?? "")
                                    .toCapitalizeEachWordCase(),
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            //
                            Text(
                              userData?.data?.nip ?? "",
                              // ((userData?.data?.avatar).isEmpty.toString()),
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                        //
                        const PartCardInfo(),
                      ],
                    ),
                  ),
                ),
                //
                const PartSwiper(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
