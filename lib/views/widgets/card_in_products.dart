
import 'package:flutter/material.dart';
import '../../models/product.dart';

class CardInProducts extends StatefulWidget {
  const CardInProducts({super.key});

  @override
  State<CardInProducts> createState() => _CardInProductsState();
}

class _CardInProductsState extends State<CardInProducts> {
  Product product = Product(
      productName: 'Table Desk Lamp Light',
      price: 140,
      imgs: [
        "https://i.pinimg.com/736x/69/86/4b/69864b4667f4d2fe121a44360977dfdd.jpg",
        "https://a66.ru/galleries/9625/03.png",
        "https://cdn4.iconfinder.com/data/icons/light-source-4/500/d392_2_lamp_table_cartoon_object_equipment_office_desk-1024.png"
      ],
      description:
      'Elevate your workspace with our Sleek and Modern Desk Lamp. This elegant lighting solution combines functionality with style, making it perfect for any home office, study area, or bedside table.');
  double price = 0;
  int selectCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      // height: 350,
      // width: MediaQuery.of(context).size.width - 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade400,
              ),
            ),
          ),

          Row(
            children: [
              Text('My Cart',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
              Container(
                // width: 150,
                // height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text("Savatdagi mahsulotlar soni",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade400
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 80,
                          height: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${product.imgs[0]}"),
                                  fit: BoxFit.fitHeight
                              ),
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                        Column(
                          children: [
                            Text('${product.productName}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  if(selectCount != 0)
                                    setState(() {
                                      selectCount--;
                                    });
                                }, icon: Icon(Icons.remove_circle)),
                                Text('$selectCount',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                IconButton(onPressed: (){
                                  setState(() {
                                    selectCount++;
                                  });
                                }, icon: Icon(Icons.add_circle))
                              ],
                            ),

                            Text('Total price: \$${selectCount * product.price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total: \$${selectCount * product.price}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
            ],
          ),

          SizedBox(height: 10,),

          InkWell(
            onTap: (){
              //Bu yerdan keyingi sahifaga otqaziladi
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15)
              ),
              alignment: Alignment.center,
              child: Text("CHECKOUT CART",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
