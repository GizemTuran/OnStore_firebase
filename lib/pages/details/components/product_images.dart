import 'package:flutter/material.dart';
import 'package:onstore/constants.dart';
<<<<<<< HEAD
=======
import 'package:onstore/core/services/firebase_service.dart';
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
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
<<<<<<< HEAD
          width:  getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product.images![selectedImage]),
            ),
=======
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
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
<<<<<<< HEAD
            ...List.generate(widget.product.images!.length, (index) => buildSmallPreview(index))
=======
            ...List.generate(widget.product.images!.length,
                (index) => buildSmallPreview(index))
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
<<<<<<< HEAD
      onTap: (){
=======
      onTap: () {
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
<<<<<<< HEAD
              margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              height: getProportionateScreenHeight(48),
              width: getProportionateScreenWidth(48),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.circular(10),
                border: Border.all(color: selectedImage == index ? kPrimaryColor : Colors.transparent)
              ),
              child: Image.asset(widget.product.images![index]),
            ),
    );
  }
}
=======
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
>>>>>>> 79733a76ed1dbc48388ca790f7c233c1b8041768
