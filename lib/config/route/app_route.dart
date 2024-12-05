import 'package:go_router/go_router.dart';
import 'package:to_do_list/presentation/screens/screens.dart';

final appRoute = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    
    GoRoute(path: '/add-item',
    builder: (context, state) => const AddItem(),)
  ],
);
