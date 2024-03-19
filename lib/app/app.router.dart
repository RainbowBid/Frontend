// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:stacked/stacked.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i8;

import '../ui/views/create_item/create_item_view.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i2;
import '../ui/views/login/login_view.dart' as _i4;
import '../ui/views/register/register_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i6;
import '../ui/views/view_items/view_items_view.dart' as _i7;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i8.StackedService.navigatorKey);

class StackedRouterWeb extends _i9.RootStackRouter {
  StackedRouterWeb({_i10.GlobalKey<_i10.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    RegisterViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CreateItemViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.CreateItemView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewItemsViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.ViewItemsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i9.RouteConfig(
          RegisterViewRoute.name,
          path: '/auth/register',
        ),
        _i9.RouteConfig(
          LoginViewRoute.name,
          path: '/auth/login',
        ),
        _i9.RouteConfig(
          CreateItemViewRoute.name,
          path: '/items/create',
        ),
        _i9.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i9.RouteConfig(
          ViewItemsViewRoute.name,
          path: '/items/all',
        ),
        _i9.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i9.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i9.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i3.RegisterView]
class RegisterViewRoute extends _i9.PageRouteInfo<void> {
  const RegisterViewRoute()
      : super(
          RegisterViewRoute.name,
          path: '/auth/register',
        );

  static const String name = 'RegisterView';
}

/// generated route for
/// [_i4.LoginView]
class LoginViewRoute extends _i9.PageRouteInfo<void> {
  const LoginViewRoute()
      : super(
          LoginViewRoute.name,
          path: '/auth/login',
        );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i5.CreateItemView]
class CreateItemViewRoute extends _i9.PageRouteInfo<void> {
  const CreateItemViewRoute()
      : super(
          CreateItemViewRoute.name,
          path: '/items/create',
        );

  static const String name = 'CreateItemView';
}

/// generated route for
/// [_i6.UnknownView]
class UnknownViewRoute extends _i9.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i7.ViewItemsView]
class ViewItemsViewRoute extends _i9.PageRouteInfo<void> {
  const ViewItemsViewRoute()
      : super(
          ViewItemsViewRoute.name,
          path: '/items/all',
        );

  static const String name = 'ViewItemsView';
}

extension RouterStateExtension on _i8.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToRegisterView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const RegisterViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCreateItemView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CreateItemViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToViewItemsView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ViewItemsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithRegisterView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const RegisterViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCreateItemView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CreateItemViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithViewItemsView(
      {void Function(_i9.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ViewItemsViewRoute(),
      onFailure: onFailure,
    );
  }
}
