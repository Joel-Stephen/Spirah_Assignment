import 'dart:convert';

import 'package:app_template/src/models/food_model.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List food=[];
  List<String> category=[];

  Future<String> loadJsonData() async {
    String jsonText = await rootBundle.loadString('lib/src/assets/sample.json');
    setState(() {
      food = json.decode(jsonText);
    });

      for (int i = 0; i < food.length; i++) {
        if (category.contains(food[i]["category"]) == false)
          category.add(food[i]["category"].toString());
        print(category.toString()+"dad");
      }
      return 'success';
    }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context,dividedBy: 1),
        width: screenWidth(context,dividedBy: 1),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context,dividedBy: 10),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: category.length,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryList(
                    category: category[index],
                    food: food,
                  );
                },
              ),
              SizedBox(
                height: screenHeight(context,dividedBy: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
