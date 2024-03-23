import 'package:flutter/material.dart';
import 'package:rainbowbid_frontend/app/app.locator.dart';
import 'package:rainbowbid_frontend/app/app.router.dart';
import 'package:rainbowbid_frontend/models/auth/jwt_storage.dart';
import 'package:rainbowbid_frontend/ui/common/app_colors.dart';
import 'package:rainbowbid_frontend/ui/common/app_constants.dart';
import 'package:rainbowbid_frontend/ui/common/ui_helpers.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:stacked_services/stacked_services.dart';

class AppSidebar extends StatelessWidget {
  AppSidebar({
    required this.controller,
    super.key,
  });

  final SidebarXController controller;
  final _routerService = locator<RouterService>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: JwtStorage.hasCurrentUser(),
      initialData: false,
      builder: (context, snapshot) => SidebarX(
        controller: controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(kdSidebarPadding),
          decoration: BoxDecoration(
            color: kcPrimaryColorDark,
            borderRadius: BorderRadius.circular(
              kdSidebarShapeRadius,
            ),
          ),
          hoverColor: kcDarkGreyColor,
          textStyle: TextStyle(color: kcWhite.withOpacity(0.7)),
          selectedTextStyle: const TextStyle(color: kcWhite),
          itemTextPadding: const EdgeInsets.only(left: kdSidebarItemPadding),
          selectedItemTextPadding: const EdgeInsets.only(
            left: kdSidebarSelectedItemPadding,
          ),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              kdSidebarItemShapeRadius,
            ),
            border: Border.all(color: kcPrimaryColorDark),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              kdSidebarSelectedItemShapeRadius,
            ),
            border: Border.all(
              color: kcMediumGrey.withOpacity(0.37),
            ),
            gradient: const LinearGradient(
              colors: [kcDarkGreyColor, kcPrimaryColorDark],
            ),
            boxShadow: [
              BoxShadow(
                color: kcBlack.withOpacity(0.28),
                blurRadius: kdSidebarSelectedItemBlurRadius,
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: kcWhite.withOpacity(0.7),
            size: kdSidebarItemIconSize,
          ),
          selectedIconTheme: const IconThemeData(
            color: kcWhite,
            size: kdSidebarSelectedItemIconSize,
          ),
        ),
        extendedTheme: const SidebarXTheme(
          width: kdSidebarExtendedWidth,
          decoration: BoxDecoration(
            color: kcPrimaryColorDark,
          ),
        ),
        footerDivider: horizontalSpaceTiny,
        headerBuilder: (context, extended) {
          return extended
              ? const SizedBox.shrink()
              : const Padding(
                  padding: EdgeInsets.all(kdSidebarAvatarImagePadding),
                  child: CircleAvatar(
                    radius: kdSidebarAvatarShapeRadius,
                    backgroundImage: AssetImage(ksLogoAssetPath),
                  ),
                );
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: ksSidebarHomeMenuText,
            onTap: () async {
              controller.selectIndex(kiSidebarHomeMenuIndex);
              await _routerService.replaceWithHomeView();
            },
          ),
          if (snapshot.hasData && snapshot.data == false) ...[
            SidebarXItem(
              icon: Icons.person_add,
              label: ksSidebarRegisterMenuText,
              onTap: () async {
                controller.selectIndex(kiSidebarRegisterMenuIndex);
                await _routerService.replaceWithRegisterView();
              },
            ),
            SidebarXItem(
              icon: Icons.login,
              label: ksSidebarLoginMenuText,
              onTap: () async {
                controller.selectIndex(kiSidebarLoginMenuIndex);
                await _routerService.replaceWithLoginView();
              },
            ),
          ] else ...[
            SidebarXItem(
              icon: Icons.logout,
              label: ksSidebarLogoutMenuText,
              onTap: () async {
                await JwtStorage.clear();
                controller.selectIndex(kiSidebarLoginMenuIndex);
                await _routerService.replaceWithLoginView();
              },
            ),
            SidebarXItem(
              icon: Icons.add,
              label: ksSidebarCreateItemMenuText,
              onTap: () async {
                controller.selectIndex(kiSidebarCreateItemMenuIndex);
                await _routerService.replaceWithCreateItemView();
              },
            ),
          ]
        ],
      ),
    );
  }
}
