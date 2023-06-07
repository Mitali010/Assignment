import 'package:flutter/material.dart';
import 'package:hifii/screens/home.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

   TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
 GlobalKey<FormState> addkey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  File? _displayImage;
  Future openCamera() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _displayImage = File(image.path);
      }
    });
  }

  Future openGallery() async {
    var picture = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (picture != null) {
        _displayImage = File(picture.path);
      }
    });
  }

  _selectImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Open Camera',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    onTap: ()  {
                     openCamera();
                  
                      Navigator.pop(context);
                    },
                  ),
                 const  Divider(
                    height: 20.0,
                    color: Colors.blueAccent,
                    thickness: 2.0,
                  ),
                  GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Open Gallery',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      onTap: ()  {
                         openGallery();
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          );
        });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Form(
              key: addkey,
              child: 
              Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                   const SizedBox(height: 40,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                 const  SizedBox(width: 25,),
                   const  Center(
                      child: Text(
                        'Add product',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ]),
                    const SizedBox(height: 50,),
               
                    InkWell(
                      onTap: () async {
                        await _selectImage(context);
                      },
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE2E2E2),
                          shape: BoxShape.circle,
                        ),
                        child: _displayImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.file(
                                  _displayImage!,
                                  fit: BoxFit.cover,
                                ))
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                     Icon(
                                      Icons.camera_alt,
                                      size: 50,
                                      color: Color(0xFF4E4E4E),
                                    ),
                                       SizedBox(height: 30,),
               
                                  
                                     Text(
                                      'Add product',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ]),
                      ),
                    ),
                       const SizedBox(height: 30,),
                  
                    
                    TextFormField(
                      controller: name,
                      
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                      
                       validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                    ),
                      const SizedBox(height: 30,),
              
                  
                    TextFormField(
                      controller: price,
                      decoration: const InputDecoration(
                        hintText: "Price",
                        hintStyle: TextStyle(color: Colors.grey)
                      ),
                       validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter price';
                                  }
                                  return null;
                                },
                    ),
                    // 
                     const SizedBox(height: 80,),
                    Center(
                      child: 
                      GestureDetector(
      onTap: () async {
      if (addkey.currentState!.validate())  {
        if(
          //_displayImage != null &&
        price.text != '' &&
        name.text != ''
        ){
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          print(name.text.toString());
          print(price.text.toString());
          print(_displayImage.toString());
          await prefs.setString('Name', name.text.toString());
          await prefs.setString('price', price.text.toString());
          // await prefs.setString('Add product', _displayImage.toString());    

           Navigator.pop(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const  HomeScreen();
                                }));
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
          "Add",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    ),
   
                
                    )
                  ]
                  )
                  ,
            ),
          ),
        ),
      ),

    );
  }
}