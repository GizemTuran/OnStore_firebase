import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.product.colors!.length,
            (index) => ColorDot(
              color: Color(int.parse(widget.product.colors![index])),
              isSelected: selectedColor == index,
              press: () {
                print("pressed");
                setState(() {
                  selectedColor = index;
                });
              },
            ),
          ),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white, shape: CircleBorder()),
            onPressed: () {},
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white, shape: CircleBorder()),
            onPressed: () {},
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  ColorDot({
    Key? key,
    required this.color,
    required this.press,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(right: 2),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          //color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
