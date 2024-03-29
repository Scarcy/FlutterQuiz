import 'package:fireshipCourse/services/auth.dart';
import 'package:fireshipCourse/services/models.dart';
import 'package:fireshipCourse/shared/error.dart';
import 'package:fireshipCourse/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(user.displayName ?? 'Guest'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(top: 50, bottom: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(user.photoURL ??
                        'https://www.gravatar.com/avatar/placeholder'),
                  ),
                ),
              ),
              Text(
                user.email ?? '',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              Text('${report.total}',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('Quizzes Completed',
                  style: Theme.of(context).textTheme.bodyMedium),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  child: const Text('Sign Out'),
                  onPressed: () async {
                    await AuthService().signOut();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Loader();
    }
  }
}
