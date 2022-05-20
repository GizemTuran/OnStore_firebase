import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
    required this.amountPress,
    required this.amount,
  }) : super(key: key);

  final Product product;
  final Function amountPress;
  final int amount;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

void incrementAmount() {
  setState() {}
  ;
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 0;
  int amount = 1;
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
            onPressed: () {
              if (amount > 1) {
                setState(() {
                  amount--;
                  widget.amountPress(-1);
                });
              }
            },
            child: const Icon(
              Icons.remove,
              color: Colors.black,
            ),
          ),
          Container(
              width: getProportionateScreenWidth(25),
              height: getProportionateScreenWidth(30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "${amount}",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              )),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.white, shape: CircleBorder()),
            onPressed: () {
              setState(() {
                amount++;
                widget.amountPress(1);
              });
            },
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
