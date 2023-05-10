import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mygexss extends StatelessWidget {
  Mygetsvalue dd = Get.put(Mygetsvalue());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Obx(() {
        return dd.status.value
            ? ListView.builder(
                itemCount: dd.aa.value.length,
                itemBuilder: (context, index) {
                  return Text("${dd.aa[index]}");
                },
              )
            : Center(child: CircularProgressIndicator());
      }),
    );
  }
}

class Mygetsvalue extends GetxController {
  var aa = [].obs;
  RxBool status = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    aa.value.add("Mayur");
    aa.value.add("12Mayur");
    aa.value.add("123Mayur");
    aa.value.add("12333Mayur");
    aa.value.add("1233333Mayur");
    aa.value.add("12333336Mayur");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    aa.value.add("zdfgsdfg");
    status.value = true;
  }
}
