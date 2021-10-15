import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumpr_web/screens/download_page.dart';

import 'screens/home_page.dart';
import 'screens/main_page.dart';

class Routes {
  Routes._();

  static const String PAGE_INITIAL = '/';
  static const String PAGE_MAIN = '/main';
  static const String PAGE_DOWNLOAD = '/download';

  static final GlobalKey<NavigatorState> rootNavigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> mainNavigatorKey =
  GlobalKey<NavigatorState>();

  static String? currentSubNavigatorInitialRoute;

  static CupertinoPageRoute<Widget>? onGenerateRoute(RouteSettings settings) {
    Widget page = HomePage();

    switch (settings.name) {
      case PAGE_INITIAL:
        page = HomePage();
        break;
      case PAGE_MAIN:
        page = MainPage();
        break;
      case PAGE_DOWNLOAD:
        page = DownloadPage();
        break;
    }

    if (settings.name == PAGE_INITIAL &&
        currentSubNavigatorInitialRoute != null) {
      // When current sub-navigator initial route is set,
      // do not display initial route because it is already displayed.
      return null;
    }

    return CupertinoPageRoute<Widget>(
      builder: (_) {
        if (currentSubNavigatorInitialRoute == settings.name) {
          return WillPopScope(
            onWillPop: () async => false,
            child: page,
          );
        }

        return page;
      },
      settings: settings,
    );
  }

  /// [MaterialApp] navigator key.
  ///
  ///
  static NavigatorState? get rootNavigator => rootNavigatorKey.currentState;

  /// [PAGE_MAIN] navigator key.
  ///
  ///
  static NavigatorState? get mainNavigator => mainNavigatorKey.currentState;

  /// Navigate to screen via [CupertinoPageRoute].
  ///
  /// If [navigator] is not set, it will use the [rootNavigator].
  static void push(Widget screen, {NavigatorState? navigator}) {
    final CupertinoPageRoute<Widget> route = CupertinoPageRoute<Widget>(
      builder: (_) => screen,
    );

    if (navigator != null) {
      navigator.push(route);
      return;
    }

    rootNavigator?.push(route);
  }

  /// Navigate to route name via [CupertinoPageRoute].
  ///
  /// If [navigator] is not set, it will use the [rootNavigator].
  static void pushNamed(
      String routeName, {
        NavigatorState? navigator,
        Object? arguments,
      }) {
    if (navigator != null) {
      navigator.pushNamed(routeName, arguments: arguments);
      return;
    }

    rootNavigator?.pushNamed(routeName, arguments: arguments);
  }

  /// Pop current route of [navigator].
  ///
  /// If [navigator] is not set, it will use the [rootNavigator].
  static void pop<T extends Object>({
    NavigatorState? navigator,
    T? result,
  }) {
    if (navigator != null) {
      navigator.pop(result);
      return;
    }

    rootNavigator?.pop(result);
  }
}

//--------------------------------------------------------------------------------
/// A navigator widget who is a child of [MaterialApp] navigator.
///
///
class SubNavigator extends StatelessWidget {
  const SubNavigator({
    required this.navigatorKey,
    required this.initialRoute,
    Key? key,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    final _SubNavigatorObserver _navigatorObserver = _SubNavigatorObserver(
      initialRoute,
      navigatorKey,
    );
    Routes.currentSubNavigatorInitialRoute = initialRoute;

    return WillPopScope(
      onWillPop: () async {
        if (_navigatorObserver.isInitialPage) {
          Routes.currentSubNavigatorInitialRoute = null;
          await SystemNavigator.pop();
          return true;
        }

        final bool canPop = navigatorKey.currentState?.canPop() ?? false;

        if (canPop) {
          navigatorKey.currentState?.pop();
        }

        return !canPop;
      },
      child: Navigator(
        key: navigatorKey,
        observers: <NavigatorObserver>[_navigatorObserver],
        initialRoute: initialRoute,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}

//--------------------------------------------------------------------------------
/// [NavigatorObserver] of [SubNavigator] widget.
///
///
class _SubNavigatorObserver extends NavigatorObserver {
  _SubNavigatorObserver(this._initialRoute, this._navigatorKey);

  final String _initialRoute;
  final GlobalKey<NavigatorState> _navigatorKey;
  final List<String> _routeNameStack = <String>[];

  bool _isInitialPage = false;

  /// Flag if current route is the initial page.
  ///
  ///
  bool get isInitialPage => _isInitialPage;


  @override
  void didPush(Route route, Route? previousRoute) {
    _routeNameStack.add(route.settings.name ?? "");
    _isInitialPage = _routeNameStack.last == _initialRoute;
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _routeNameStack.remove(route.settings.name);
    _isInitialPage = _routeNameStack.last == _initialRoute;
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _routeNameStack.remove(route.settings.name);
    _isInitialPage = _routeNameStack.last == _initialRoute;
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _routeNameStack.remove(oldRoute?.settings.name ?? "");
    _routeNameStack.add(newRoute?.settings.name ?? "");
    _isInitialPage = _routeNameStack.last == _initialRoute;
  }
}