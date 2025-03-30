import 'package:go_router/go_router.dart';
import '../features/historical_places/presentation/screens/welcome_screen.dart';
import '../features/historical_places/presentation/screens/historical_place_screen.dart';

final List<RouteBase> appRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const WelcomeScreen(),
    routes: [
      GoRoute(
        path: 'place/:placeId',
        builder: (context, state) {
          final placeId = state.pathParameters['placeId']!;
          return HistoricalPlaceScreen(placeId: placeId);
        },
      ),
    ],
  ),
];