import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_shop/Pages/main_page.dart';
import 'package:get/get.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
    
      Get.to(
        () => const MainPage(),
        transition: Transition.fade,
        duration: const Duration(seconds: 1),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Lottie.asset("assets/lotties/shopping.json"),
      ),
    );
  }
}
