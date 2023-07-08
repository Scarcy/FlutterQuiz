import 'package:fireshipCourse/routes.dart';
import 'package:fireshipCourse/services/firestore.dart';
import 'package:fireshipCourse/services/models.dart';
import 'package:fireshipCourse/theme.dart';
import 'package:flutter/material.dart';
import 'package:fireshipCourse/home/home.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('error: ${snapshot.error}'), // Modify this line,
              ),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider(
            create: (context) => FirestoreService().streamReport(),
            initialData: Report(),
            child: MaterialApp(
              home: const HomeScreen(), // Add this line
              routes: appRoutes,
              theme: appTheme,
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('loading'),
            ),
          ),
        );
      },
    );
  }
}
