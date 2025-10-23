import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(PageRoute<dynamic> route) {
    final screenName = route.settings.name ?? route.runtimeType.toString();
    debugPrint(' Navigated to → $screenName');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }
}
