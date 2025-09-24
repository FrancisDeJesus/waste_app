import 'package:go_router/go_router.dart';
import 'features/startup/startup_screen.dart';
import 'features/auth/signin_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/auth/signup_screen.dart';
import 'features/dashboard/dashboard_screen.dart';
import 'features/waste/select_waste_screen.dart';
import 'features/pickup/schedule_pickup_screen.dart';
import 'features/points/points_screen.dart';
import 'features/redeem/redeem_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/start', // show Start Up first
  routes: [
    GoRoute(path: '/start', builder: (context, state) => const StartUpScreen()),
    GoRoute(path: '/signin', builder: (c, s) => const SignInScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
    GoRoute(path: '/register', builder: (context, state) => const RegisterScreen()),
    GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
    GoRoute(path: '/waste/select', builder: (context, state) => const SelectWasteScreen()),
    GoRoute(path: '/pickup/schedule', builder: (context, state) => const SchedulePickupScreen()),
    GoRoute(path: '/points', builder: (context, state) => const PointsScreen()),
    GoRoute(path: '/redeem', builder: (context, state) => const RedeemScreen()),
  ],
);
