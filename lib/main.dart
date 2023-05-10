import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'mydemo_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => MydemoBloc(),
        )
      ],
      child: MaterialApp(
        home: Mydemo(),
      ),
    ),
  );
}

class Mydemo extends StatefulWidget {
  const Mydemo({Key? key}) : super(key: key);

  @override
  State<Mydemo> createState() => _MydemoState();
}

class _MydemoState extends State<Mydemo> {
  MydemoBloc? mydemoBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mydemoBloc = BlocProvider.of<MydemoBloc>(context);
    mydemoBloc!.add(IntialEvent(0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IconButton(
              onPressed: () {
                mydemoBloc!.add(Decreent());
              },
              icon: Icon(Icons.exposure_minus_1)),
          BlocBuilder<MydemoBloc, MydemoState>(
            builder: (context, state) {
              if (state is MydemoInitial) {
                return Text("${state.i}");
              }
              return Text("===");
            },
          )
        ],
      ),
    );
  }
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
