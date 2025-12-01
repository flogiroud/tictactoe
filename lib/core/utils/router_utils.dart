class RouterUtils {
  static String routeName(String route) =>
      route.startsWith('/') ? route.substring(1) : route;
}
