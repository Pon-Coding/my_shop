import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_shop/Models/product_model.dart';
import 'package:my_shop/Pages/invoice_page.dart';
import 'package:my_shop/Providers/home_provider.dart';
import 'package:my_shop/TextStyles/fontstyle.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double myTotal = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myTotal = 0;
    context
        .watch<HomeProvider>()
        .cartList
        .map((e) => myTotal += e.price * e.qty)
        .toList();
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.watch<HomeProvider>().cartList.isEmpty
                  ? 
                  Text("Clear All", style: totalStyle) : InkWell(
                      onTap: () {
                        context.read<HomeProvider>().removeAll();
                      },
                      child: Text("Clear All", style: totalPriceStyle)),
            ],
          ),
         const SizedBox(width: 15),
        ],
        centerTitle: true,
        title: SizedBox(
            width: 200, child: Image.asset("assets/images/myCart.png")),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ));
  }

  Widget get _buildBody {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: const Color(0xFF3C4142).withOpacity(.1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: _buildGridView,
    );
  }

  Widget get _buildGridView {
    if (context.watch<HomeProvider>().cartList.isEmpty) {
      return Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset("assets/lotties/noItem1.json"),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
              width: MediaQuery.of(context).size.width,
              height: 550,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: context.watch<HomeProvider>().cartList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  return _buildItem(
                      context.watch<HomeProvider>().cartList[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            "Subtotal:",
                            style: totalStyle,
                          )),
                      SizedBox(
                          width: 80,
                          child: Text(
                            "\$$myTotal",
                            style: totalPriceStyle,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            "Discount:",
                            style: totalStyle,
                          )),
                      SizedBox(
                          width: 80,
                          child: Text(
                            "0%",
                            style: totalPriceStyle,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 80,
                          child: Text(
                            "Total:",
                            style: totalStyle,
                          )),
                      SizedBox(
                          width: 80,
                          child: Text(
                            "\$$myTotal",
                            style: totalPriceStyle,
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$$myTotal",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const InvoicePage(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF383fa5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            CupertinoIcons.shopping_cart,
                            color: Colors.white,
                          ),
                          Text("Check Out",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: 'Roboto')),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  Widget _buildItem(ProductModel item) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: .3,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
              spacing: 5,
              borderRadius: BorderRadius.circular(30),
              label: "Remove",
              icon: CupertinoIcons.trash,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              onPressed: (context) {
                context.read<HomeProvider>().removeByItem(item);
                setState(() {
                  myTotal -= item.price * item.qty;
                });
              }),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: _buildRow(item),
      ),
    );
  }

  Widget _buildRow(ProductModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          child: Image.asset(item.image),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.name,
              style: itemStyle,
            ),
            const SizedBox(height: 10),
            Text(
              "\$${item.price * item.qty}",
              style: priceStyleCart,
            )
          ],
        ),
        const SizedBox(width: 100),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  item.qty++;
                });
              },
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF383fa5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(.1, .1),
                        spreadRadius: .1,
                        color: const Color(0xFF3C4142).withOpacity(.5),
                      )
                    ]),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(item.qty.toString()),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                if (item.qty > 1) {
                  setState(() {
                    item.qty--;
                  });
                }
              },
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(.1, .1),
                        spreadRadius: .1,
                        color: const Color(0xFF3C4142).withOpacity(.5),
                      )
                    ]),
                child: const Icon(
                  Icons.remove_rounded,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
//#addbf3
