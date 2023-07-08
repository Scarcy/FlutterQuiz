//import 'package:fireshipCourse/home/home.dart';
import 'package:fireshipCourse/about/about.dart';
import 'package:fireshipCourse/login/login.dart';
import 'package:fireshipCourse/profile/profile.dart';
import 'package:fireshipCourse/topics/topics.dart';

var appRoutes = {
  //'/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
