
import 'package:flutter/material.dart';
import 'package:my_shop/Pages/splash_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Providers/home_provider.dart';

Widget providerWithMainScreen(){
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>HomeProvider()),
  ],
  child: const MainScreen(),
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}