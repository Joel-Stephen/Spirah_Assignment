import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/product_list.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final String category;
  final List food;
  CategoryList({this.category,this.food});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    // TODO: implement initState
    print(widget.category);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: screenWidth(context,dividedBy: 2),
            height: screenHeight(context,dividedBy: 30),
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black)
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.category,style: TextStyle(fontSize: screenWidth(context,dividedBy: 20),fontWeight: FontWeight.w600),
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.food.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return widget.category==widget.food[index]["category"]?ProductList(
                food: widget.food[index]["productName"],
              ):Container();
            },
          )
        ],
      ),
    );
  }
}
