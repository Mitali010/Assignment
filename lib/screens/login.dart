import 'package:flutter/material.dart';

import 'package:hifii/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/apiservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
      GlobalKey<FormState> personaldetailskey = GlobalKey<FormState>();
        bool notShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                 child:  Image.asset('lib/images/login2.png'),
            ),
           
            const SizedBox(
              height: 35,
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [ Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                     // fontFamily: 'Poppins',
                      color: Colors.black87),
                      textAlign: TextAlign.start,
                ),
                ]
              ),
            ),
              const SizedBox(
              height: 23,
            ),
            Form(
                key: personaldetailskey,
              child: Column(children: [
               Padding
            (
              padding:const EdgeInsets.symmetric(horizontal: 25.0) ,
              child: Row(children: [
                const Text("@", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 21),),
                 const SizedBox(
                width: 15,
                
              ),
                      Expanded(
                        child: TextFormField(
                                  controller: emailcontroller,
                                  
                      
                                  cursorColor: Colors.black,
                      
                                  
                                  decoration: const InputDecoration(
                                    hintText: "Email ID",
                                  hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 17)

                                  ),
                                 validator: (value) {
                                        if (value == null ||
                                            value.isEmpty && value.length <= 15) {
                                          return 'Please enter detail';
                                        }
                                        return null;
                                      },  
                                ),
                      ), 

//                      
                
              ],),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding
            (
              padding:const EdgeInsets.symmetric(horizontal: 25.0) ,
              child: Row(children: [
                const Icon(Icons.lock_outline_rounded, color:Colors.grey ,),
                
                 const SizedBox(
                width: 15,
                
              ),
                      Expanded(
                        child: TextFormField(
                            obscureText: notShowPassword,
                                  controller: passwordcontroller,
                                  
                      
                                  cursorColor: Colors.black,
                      
                                  
                                  decoration:  InputDecoration(
                                    hintText: "Password",
                                  hintStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 17),
                                   suffixIcon: InkWell(
                                onTap:
                                 () {
                                  setState(() {
                                    notShowPassword = !notShowPassword;
                                  });
                                },
                                child:  Icon(
                                  notShowPassword ? Icons.visibility : Icons.visibility_off,
                              
                                  size: 19,
                                  color: Colors.grey,
                                ))
                                  ),
                                  
                                
                                 validator: (value) {
                                        if (value == null ||
                                            value.isEmpty && value.length <= 15) {
                                          return 'Please enter detail';
                                        }
                                        return null;
                                      },  
                                ),
                      ), 

                    
                
              ],),
            ),
             const SizedBox(height: 17,),
             Padding( padding:  const EdgeInsets.symmetric(horizontal: 25.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text("Forget password?", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
              ],
             )
             ,),

            ],)
           
            ) ,
            const SizedBox(height: 17,),
            GestureDetector(
      onTap: ()async{
          if (personaldetailskey.currentState!.validate()){
             final res = await ApiService().login({
                        'email': emailcontroller.text,
                        'password': passwordcontroller.text
                      });
     
     
     
                      print(res['token'].toString());
                      print('-----------------');   
                      if(res["token"] != null){
                        print('333333333333333333333333333');
                        
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        const HomeScreen()), (Route<dynamic> route) => false);
                      }
                        }
      },
      child: Container(
      
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
            child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    ),
     const SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New to Logistics?", style: TextStyle(color: Colors.grey[700]),),
                     const SizedBox(width: 4,),
                   const Text("Register",style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),)                ],
                )
                   
   
          ],
                ),
              )),
    );
  }
}
