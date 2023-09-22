import 'package:flutter/material.dart';
import 'package:second_task_bti/data/map.dart';
import 'package:second_task_bti/data/model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Category> categories = categoryMap.map((e) => Category(e) ).toList();
  int selectedIndex = 100 ;
  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الرئيسية"),
        centerTitle: true ,
        backgroundColor: Colors.red,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network("https://images.crunchbase.com/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/gkklwfovmqbetq7tmqhv" , width: double.infinity,height: 200,fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.only(left: 10 , right: 10 , top: 10),
            child: Text("التصنيفات" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20 , right: 20),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return  InkWell(
                  onTap: () {
                    selectedIndex = index;
                    products = categories[index].products ?? [];
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(categories[index].image ?? "", width: 100, height: 100,),
                      )
                    ],),
                );
              },),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(products[index].image ?? "",width: double.infinity,height: 135,),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(products[index].name ?? "" , style: TextStyle(fontSize: 20),) ,
                            Text(products[index].price.toString() , style: TextStyle(color: Colors.red , fontSize: 20),)],

                        ),
                      Container(
                        width: 200,
                        height: 33,
                        color: Colors.red,
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart ,color: Colors.white,),
                            Text("أضف إلى السلة ",style: TextStyle(color: Colors.white,fontSize: 20)),

                          ],

                        ),
                      ),
                    ],
                  ),
                ) ;

              },),
          ),

        ],
      ),

    );
  }
}
