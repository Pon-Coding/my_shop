import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_shop/Models/product_model.dart';
import 'package:my_shop/TextStyles/fontstyle.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Providers/home_provider.dart';
class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}
double myTotal = 0;
String get getMyCurrentDate {
  DateTime now = DateTime.now();
  int day = now.day;
  String month = now.month.toString();
  int year = now.year;
  int hour = now.hour;
  int minute = now.minute;

  // Get AM or PM
  String ampm = DateFormat('a').format(now);

  return '$day/$month/$year $hour:$minute $ampm';
}

class _InvoicePageState extends State<InvoicePage> {
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
      leading: InkWell(
        
        onTap: (){
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios_rounded,color: Colors.black,)),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text("Invoice",style: btnSheetHeaderStyle,),
      centerTitle: true,
      actions:const [
        Icon(Icons.print_rounded,color: Colors.black,),
        SizedBox(width:15),
      ],
    );
  }

  Widget get _buildBody {
    return Container(
      child: _buildGridView,
    );
  }

  Widget get _buildGridView {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          color: Colors.grey.withOpacity(.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Blue Technolog",
              style: itemStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Date : $getMyCurrentDate",
              style: itemStyle,
            ),
          ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                // color: Colors.yellow,
                width: 60,
                alignment: Alignment.centerLeft,
                child: const Text("Quantity")),
            Container(
                // color: Colors.yellow,
                width: 80,
                alignment: Alignment.centerLeft,
                child: const Text("Title")),
            Container(
                width: 50,
                // color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Text("Price")),
          ],
        ),
        const Divider(
          height: 15,
          color: Colors.black,
          indent: 32,
          endIndent: 32,
          thickness: 2,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 30 * context.watch<HomeProvider>().cartList.length.toDouble(),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.watch<HomeProvider>().cartList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, mainAxisExtent: 30),
            itemBuilder: (context, index) {
              return _buildItem(context.watch<HomeProvider>().cartList[index]);
            },
          ),
        ),
        const Divider(
          height: 15,
          color: Colors.black,
          indent: 32,
          endIndent: 32,
          thickness: 2,
        ),
        Container(

          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                      alignment: Alignment.centerLeft,
                      child: const Text("Subtotal: ")),
                  Container(
                    width: 55,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft, 
                    child: Text("\$$myTotal")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                      alignment: Alignment.centerLeft,
                      child: const Text("Discount: ")),
                  Container(
                    width: 55,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft, 
                    child: const Text("%0")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                      alignment: Alignment.centerLeft,
                      child: const Text("Total: ")),
                  Container(
                    width: 55,
                    // color: Colors.red,
                    alignment: Alignment.centerLeft, 
                    child: Text("\$$myTotal")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(ProductModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            // color: Colors.yellow,
            width: 60,
            alignment: Alignment.centerLeft,
            child: Text("${item.qty}x")),
        Container(
            // color: Colors.yellow,
            width: 80,
            alignment: Alignment.centerLeft,
            child: Text(item.name)),
        Container(
            width: 50,
            // color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Text("\$${item.price*item.qty}")),
      ],
    );
  }


  
}
