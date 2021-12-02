import 'package:cosmic1/ui/routes/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Movie',
        initialRoute: '/',
        navigatorKey: Get.key,
        getPages: routes(),
        // routes: {
        //   'login'    : ( BuildContext context ) => LoginScreen(),
        //   'signup'   : ( BuildContext context ) => SignupScreen(),
        //   'home'     : ( BuildContext context ) => HomeScreen()
        // },
        
      );
    
  }
}