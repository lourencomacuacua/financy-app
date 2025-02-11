import 'package:finaceiro/common/constantns/routes.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nova Tela"),
            ElevatedButton(
                onPressed: () {
                  _secureStorage.deleteOne(key: "CURRENT_USER").then(
                        (_) => Navigator.popAndPushNamed(
                            context, NamesRoute.initial),
                      );
                },
                child: Text("Logout")),
          ],
        ),
      ),
    );
  }
}
