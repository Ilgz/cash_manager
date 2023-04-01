import 'package:flutter/material.dart';

class IncomeExpenseChart extends StatelessWidget {
   IncomeExpenseChart({Key? key}) : super(key: key);
   List<List<int>> chartData=List.generate(12, (index) => [60,15]);
   List<String> chartMonths=["Jan","","Mar","","May","","Jul","","Sep","","Nov",""];
  @override
  Widget build(BuildContext context) {
    return Card(elevation:12,child:Column(children: [
      SizedBox(height: 16,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         ...chartData.map((value) => SizedBox(width:22,child: Align(alignment:Alignment.bottomCenter,child: Candle(isIncome: true,value: value.first,)))),
        ],
      ),
      Container(color:Colors.grey[400] ,width: double.infinity,height: 1,),
      Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         ...chartData.map((value) => SizedBox(width:22,child: Align(alignment:Alignment.topCenter,child: Candle(isIncome: false,value: value.last,)))),
       ],
      ),
      SizedBox(height: 16,),
      SizedBox(height: 30,child:Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,children: [
        ...chartMonths.map((value) => SizedBox(width: 22,child: Align(alignment:Alignment.topCenter,child: Text(value,style: TextStyle(fontSize: 10,color: Colors.grey),)),)),
      ],),)
    ],),);
  }
}
class Candle extends StatelessWidget {
  const Candle({Key? key, required this.isIncome, required this.value}) : super(key: key);
  final bool isIncome;
  final int value;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 6,height: value.toDouble(),decoration: BoxDecoration(color: isIncome?Color(0xff01359a):Color(0xff08b1e2),borderRadius: isIncome?BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)):BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),);
  }
}

