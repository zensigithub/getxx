import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Myproviderr extends StatelessWidget {
  const Myproviderr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => Myprovider(),
        child: Consumer<Myprovider>(
          builder: (context, value, child) {
            return Column(
              children: [
                Text("${value.cnt}"),
                ElevatedButton(
                    onPressed: () {
                      value.Mysum();
                    },
                    child: child)
              ],
            );
          },
        ),
      ),
    );
  }
}

class Myprovider extends ChangeNotifier {
  int cnt = 0;

  void Mysum() {
    cnt++;
    notifyListeners();
  }
}
