import 'package:first_app/widget/expense.dart';
import 'package:flutter/material.dart';

var KColors = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 128, 255, 147),
);
var KDColors = ColorScheme.fromSeed(
  seedColor:Color.fromARGB(255, 146, 204, 230),
);
var  dark =ThemeMode.dark;

void main() {
  runApp(Mains());
}
class Mains extends StatefulWidget{
  @override
  State<Mains> createState() {


    return _Mains();
}
}

var darks=ThemeMode.light;



class  _Mains extends  State<Mains>{


  void darkMode(){
    if(darks==ThemeMode.light){
    setState(() {
      darks=ThemeMode.dark;
    });
    }
    else{
      setState(() {
        darks=ThemeMode.light;
      });

    }
  }
 @override
 Widget build(context){

  return  MaterialApp(
      debugShowCheckedModeBanner: false,
     darkTheme: ThemeData.dark().copyWith(
       appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.black,
            foregroundColor: KDColors.onPrimary,
            shadowColor: KColors.error,
          ),
            bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor:Colors.black
        ),
        brightness: Brightness.dark,
        colorScheme: KDColors,
        cardTheme: const CardTheme().copyWith(
          color: KDColors.primaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: KDColors.onPrimary),
        ),
         scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 18, color: Colors.black),
              bodySmall:const  TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
      ), 
      theme: ThemeData().copyWith(
          colorScheme: KColors,
          scaffoldBackgroundColor: KColors.primaryContainer,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: KColors.primary,
            foregroundColor: KColors.onPrimary,
            shadowColor: KColors.error,
          ),
          cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            color:Colors.green,
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(fontSize: 18, color: Colors.black),
              bodySmall:const  TextStyle(color: Colors.white)),
                    
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: KColors.primaryContainer),
        ),
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: Color.fromARGB(255, 168, 168, 168)
        )
              
              
              ),
              themeMode: darks,
     
          
      home:   Expense(darkMode),
    
    );

 }

}