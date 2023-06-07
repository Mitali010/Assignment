import 'package:flutter/material.dart';
import 'package:hifii/screens/add.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(child: Padding
        (
          padding: const EdgeInsets.symmetric(horizontal:15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:   [
              Padding(
                padding: const EdgeInsets.all(20),
                child: 
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 44,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all( 
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white
                      ),
                      child:  const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20, ),
                    ),

              
                    Container(
                      height: 44,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: 
                        Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white
                      ),
                      child:  const Icon(Icons.search, color: Colors.grey, ),
                    )
              
                  ],
              
                ),
              ),
               const  SizedBox(height: 25), 

                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [ Text(
                  'Hi-Fi Shop & Service',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                     // fontFamily: 'Poppins',
                      color: Colors.black87),
                      textAlign: TextAlign.start,
                ),
                ]
              ),
            ),
            
              const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [ Text(
                  'Audio shop on Rustaveli Ave 57.\nThis shop offers both products and services',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                     fontFamily: 'Poppins',
                      color: Colors.grey),
                      textAlign: TextAlign.start,
                ),
                ]
              ),
            ),
           
              
              
              const SizedBox(height: 40,),
               Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [ 
                  Text(
                  'Products',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                     fontFamily: 'Poppins',
                      color: Colors.black87),
                      textAlign: TextAlign.start,
                ),
                  SizedBox(width: 160,),

                 Text(
                  'Show all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                     fontFamily: 'Poppins',
                      color: Colors.blue),
                      textAlign: TextAlign.end,
                ),
                ]
              ),
              
            ),
            const SizedBox(height: 30,),
            Row(children: [
              Container(
                height: 140,
                width: 170,
                child: Image.asset('lib/images/headphones.jpg'),

              ),
                const SizedBox(width: 20,),
                Container(
                height: 140,
                width: 170,
                child: Image.asset('lib/images/headphones1.jpg'),

              ),

            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const[
                    Text("AAA N67GH7 Wireless\nheadphones",style: TextStyle(fontWeight: FontWeight.bold),),
                    //  SizedBox(height: 10,),
                    // Text('\$1999.00', style: TextStyle(color: Colors.grey), textAlign: TextAlign.start,)

                  ],
                ),
                const  SizedBox(width: 40,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const[
                    Text("AAA N67GH7 Wireless\nheadphones",style: TextStyle(fontWeight: FontWeight.bold),),
                    

                  ],
                )
               ],
            ),
             const  SizedBox(height: 10,),
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const[
                    Text("\$1777.00",style: TextStyle(color: Colors.grey),),
             

                  ],
                ),
                const  SizedBox(width:120,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const[
                    Text("\$1200",style: TextStyle(color: Colors.grey),),
                

                  ],
                )
               ],
            ),
             
            //
              
            ],
          ),
        )),
      ),
      bottomNavigationBar: 
   Padding
   (
     padding: const EdgeInsets.all(25),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.end,
       children:  [ GestureDetector(
        onTap: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddScreen()),
              );
        },
            
       
         child:  const CircleAvatar(
         backgroundColor: Colors.blueAccent,
         radius: 30,
         child: Icon(
          Icons.add,
          color: Colors.white, size: 26,
         ),
            ),
       ),
       ]
     ),
   ),
    
    );
  
  }
}