import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final String food;
  ProductList({this.food});
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                widget.food,style: TextStyle(fontSize: screenWidth(context,dividedBy: 30),fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
