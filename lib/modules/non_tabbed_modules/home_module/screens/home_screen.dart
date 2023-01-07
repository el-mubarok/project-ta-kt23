import 'package:attendanceapp/config/routes/route_names.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/screens/part_card_info.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/screens/part_swiper.dart';
import 'package:attendanceapp/shared/ui/wrappers/wrapper_page.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ModuleHome extends StatefulWidget {
  const ModuleHome({super.key});

  @override
  State<StatefulWidget> createState() => _ModuleHome();
}

class _ModuleHome extends State<ModuleHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
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
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.network(
                              "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                              isAntiAlias: true,
                            ),
                          ),
                        ),
                        //
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text(
                            "Duke Campbell",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        //
                        const Text(
                          "230102",
                          style: TextStyle(
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
    );
  }
}
