import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
import 'package:onstore/core/services/firebase_service.dart';
import 'package:onstore/models/Product.dart';
import 'package:onstore/size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: FutureBuilder(
              future: getImage(context, widget.product.images![selectedImage]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return (snapshot.data as Image);
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.width / 1.2,
                    child: CircularProgressIndicator(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images!.length,
                (index) => buildSmallPreview(index))
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        height: getProportionateScreenHeight(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selectedImage == index
                    ? kPrimaryColor
                    : Colors.transparent)),
        child: FutureBuilder(
          future: getImage(context, widget.product.images![index]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return (snapshot.data as Image);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.width / 1.2,
                child: CircularProgressIndicator(
                  color: kPrimaryColor.withOpacity(0.5),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
