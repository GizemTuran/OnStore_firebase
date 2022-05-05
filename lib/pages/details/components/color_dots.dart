import 'package:flutter/material.dart';
import 'package:onstore/shared/components/rounded_icon_btn.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 0;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(product.colors!.length, (index) => ColorDot(color: Color(product.colors![index].hashCode), isSelected: selectedColor == index,),),
        Spacer(),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white, shape: CircleBorder() ),
          onPressed: () {},
          child: Icon(Icons.remove, color: Colors.black,),
          ),
          TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white, shape: CircleBorder() ),
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.black,),
          ),
        ],        
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color, this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          //color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
          ),
        ),
      ),
    );
  }
}