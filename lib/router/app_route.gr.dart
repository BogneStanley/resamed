// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:hospital/presentation/check_auth/check_auth_screen.dart'
    as _i14;
import 'package:hospital/presentation/consultation/consultation_screen.dart'
    as _i4;
import 'package:hospital/presentation/consultation/sub_screen/reservation/reservation_screen.dart'
    as _i5;
import 'package:hospital/presentation/exam/exam_screen.dart' as _i11;
import 'package:hospital/presentation/exam/widgets/tabs/exam_history_tab.dart'
    as _i10;
import 'package:hospital/presentation/exam/widgets/tabs/exam_tab.dart' as _i9;
import 'package:hospital/presentation/home/home_screen.dart' as _i12;
import 'package:hospital/presentation/layout/layout_screen.dart' as _i1;
import 'package:hospital/presentation/login/login_screen.dart' as _i3;
import 'package:hospital/presentation/register/register_screen.dart' as _i6;
import 'package:hospital/presentation/register/sub_screen/choice_user_type/choice_user_type_screen.dart'
    as _i8;
import 'package:hospital/presentation/register/sub_screen/doctor/doctor_info_screen.dart'
    as _i7;
import 'package:hospital/presentation/settings/settings_screen.dart' as _i2;
import 'package:hospital/presentation/template/template_screen.dart' as _i13;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    LayoutRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LayoutScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SettingsScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    ConsultationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ConsultationScreen(),
      );
    },
    ReservationRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ReservationScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
    DoctorInfoRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DoctorInfoScreen(),
      );
    },
    ChoiceUserTypeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ChoiceUserTypeScreen(),
      );
    },
    ExamTab.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ExamTab(),
      );
    },
    ExamHistoryTab.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ExamHistoryTab(),
      );
    },
    ExamRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ExamScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.HomeScreen(),
      );
    },
    TemplateRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.TemplateScreen(),
      );
    },
    CheckAuthRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CheckAuthScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LayoutScreen]
class LayoutRoute extends _i15.PageRouteInfo<void> {
  const LayoutRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SettingsScreen]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ConsultationScreen]
class ConsultationRoute extends _i15.PageRouteInfo<void> {
  const ConsultationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ConsultationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConsultationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ReservationScreen]
class ReservationRoute extends _i15.PageRouteInfo<void> {
  const ReservationRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ReservationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReservationRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i15.PageRouteInfo<void> {
  const RegisterRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DoctorInfoScreen]
class DoctorInfoRoute extends _i15.PageRouteInfo<void> {
  const DoctorInfoRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DoctorInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorInfoRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ChoiceUserTypeScreen]
class ChoiceUserTypeRoute extends _i15.PageRouteInfo<void> {
  const ChoiceUserTypeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ChoiceUserTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoiceUserTypeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ExamTab]
class ExamTab extends _i15.PageRouteInfo<void> {
  const ExamTab({List<_i15.PageRouteInfo>? children})
      : super(
          ExamTab.name,
          initialChildren: children,
        );

  static const String name = 'ExamTab';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ExamHistoryTab]
class ExamHistoryTab extends _i15.PageRouteInfo<void> {
  const ExamHistoryTab({List<_i15.PageRouteInfo>? children})
      : super(
          ExamHistoryTab.name,
          initialChildren: children,
        );

  static const String name = 'ExamHistoryTab';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ExamScreen]
class ExamRoute extends _i15.PageRouteInfo<void> {
  const ExamRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ExamRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExamRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.TemplateScreen]
class TemplateRoute extends _i15.PageRouteInfo<void> {
  const TemplateRoute({List<_i15.PageRouteInfo>? children})
      : super(
          TemplateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TemplateRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CheckAuthScreen]
class CheckAuthRoute extends _i15.PageRouteInfo<void> {
  const CheckAuthRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CheckAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckAuthRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
