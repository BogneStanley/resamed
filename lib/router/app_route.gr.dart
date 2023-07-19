// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:hospital/presentation/home/home_screen.dart' as _i6;
import 'package:hospital/presentation/layout/layout_screen.dart' as _i1;
import 'package:hospital/presentation/login/login_screen.dart' as _i2;
import 'package:hospital/presentation/register/register_screen.dart' as _i3;
import 'package:hospital/presentation/register/sub_screen/choice_user_type/choice_user_type_screen.dart'
    as _i5;
import 'package:hospital/presentation/register/sub_screen/doctor/doctor_info_screen.dart'
    as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LayoutRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterScreen(),
      );
    },
    DoctorInfoRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DoctorInfoScreen(),
      );
    },
    ChoiceUserTypeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChoiceUserTypeScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LayoutScreen]
class LayoutRoute extends _i7.PageRouteInfo<void> {
  const LayoutRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DoctorInfoScreen]
class DoctorInfoRoute extends _i7.PageRouteInfo<void> {
  const DoctorInfoRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DoctorInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorInfoRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ChoiceUserTypeScreen]
class ChoiceUserTypeRoute extends _i7.PageRouteInfo<void> {
  const ChoiceUserTypeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          ChoiceUserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoiceUserTypeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
