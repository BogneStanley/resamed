import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: LayoutRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: ChoiceUserTypeRoute.page),
        AutoRoute(page: DoctorInfoRoute.page),
        AutoRoute(page: ReservationRoute.page),
        AutoRoute(page: CheckAuthRoute.page, initial: true),
      ];
}
