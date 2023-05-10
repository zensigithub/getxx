import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Providerr.dart';

void main() {
  runApp(GetMaterialApp(
    home: MaterialApp(
      home: Myproviderr(),
    ),
  ));
}

// state = > a Data or an Informtion

// int a = 10;
// mutable
// Immutable
// setState =>

class Myapi extends StatefulWidget {
  const Myapi({Key? key}) : super(key: key);

  @override
  State<Myapi> createState() => _MyapiState();
}

// getx == State Managment

class _MyapiState extends State<Myapi> with TickerProviderStateMixin {
  AnimationController? animationController;
  late Animation animation;
  late Animation coloranimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mygetx = Get.put(Mygetx());
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 0.0, end: 200.0)
        .animate(animationController!); // SizeAnimation

    coloranimation = ColorTween(begin: Colors.black, end: Colors.yellow)
        .animate(animationController!);
    animationController!.forward();

    animationController!.addListener(() {
      setState(() {});
      print("===${animation.value}");
    });
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  Mygetx? mygetx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: t1,
          ),
          TextField(
            controller: t2,
          ),
          ElevatedButton(
              onPressed: () {
                mygetx!.Mysum(t1.text, t2.text);
              },
              child: Text("Submit")),
          Obx(() => Text("Sum==${mygetx!.sum.value}"))
        ],
      ),
    );
  }
}

class Mygetx extends GetxController {
  RxString sum = "".obs;
  RxInt gg = 0.obs;
  int aaa = 0;
  int bb = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void Mysum(String a, String b) {
    if (a.isNotEmpty) {
      aaa = int.parse(a);
    } else {
      // vdfsd
      aaa = 0;
    }
    bb = int.parse(b);
    int c = aaa + bb;
    sum.value = c.toString();
  }
}
