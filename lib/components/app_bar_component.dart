import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kodestart_rickmorty/pages/home_page.dart';
import 'package:kodestart_rickmorty/theme/app_colors.dart';
import 'package:kodestart_rickmorty/theme/app_images.dart';

PreferredSizeWidget appBarComponent(
  BuildContext context, {
  bool isSecondPage = false,
}) {
  return AppBar(
    toolbarHeight: kToolbarHeight * 2.2,
    backgroundColor: AppColors.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    leading: Align(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          final currentRoute = ModalRoute.of(context)?.settings.name;
          if (currentRoute == HomePage.routeId) return;
          Navigator.of(context).pop();
        },
        child: Icon(
          isSecondPage ? Icons.arrow_back_ios : Icons.menu,
        ),
      ),
    ),
    actions: [
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.person,
          color: AppColors.white,
        ),
      )
    ],
    flexibleSpace: SafeArea(
        child: Column(
      children: [
        Image.asset(AppImages.logo),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            "RICK AND MORTY API",
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        )
      ],
    )),
  );
}
