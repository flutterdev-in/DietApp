import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AnimatedContainerFlex extends StatelessWidget {
  AnimatedContainerFlex({Key? key}) : super(key: key);
  var ht = 100.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: ht.value.toDouble(),
            color: Colors.blue,
            child: ElevatedButton(
              child: Text("hi${ht.value}"),
              onPressed: () {
                ht.value = ht.value == 100 ? 200 : 100;
                //ht = ht == 100.obs ? 200.obs : 100.obs;
              },
            ),
          ),
        ]));
  }
}


/* 
# Set State method

class AnimatedContainerFlex extends StatefulWidget {
  const AnimatedContainerFlex({Key? key}) : super(key: key);

  @override
  _AnimatedContainerFlexState createState() => _AnimatedContainerFlexState();
}

class _AnimatedContainerFlexState extends State<AnimatedContainerFlex> {
  var ht = 100;
  void htf() {
    setState(() {
      ht = ht == 100 ? 200 : 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: ht.toDouble(),
          color: Colors.blue,
          child: ElevatedButton(
              onPressed: () {
                htf();
              },
              child: Text("hi")),
        ),
      ],
    );
  }
}
*/
