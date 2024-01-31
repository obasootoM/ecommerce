import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String groupval = 'male';
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Stack(children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                width: width * 0.2,
                height: height * 0.08,
                decoration: ShapeDecoration(
                    color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: width * 0.09,
                  height: height * 0.1,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        offset: Offset(
                          0.1,
                          0.1,
                        ),
                        blurRadius: 1,
                        color: Colors.black),
                  ], color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.camera),
                ),
              )
            ]),
          ),
          const Text(
            'Upload Image',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              child: Column(
            children: [
             Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.2,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: const Text('Name',style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      constraints: BoxConstraints(maxHeight: height * 0.1,
                      maxWidth: width * 0.7
                    ),
                      child: TextFormField(
                          style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          disabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black)
                          )
                          ),
                      ),
                    )
                  ]),
                ),
              )
             ],),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: width * 0.45,
                      height: height * 0.07,
                      decoration: ShapeDecoration(
                          shadows: const [
                            BoxShadow(offset: Offset(0.1, 0.1), blurRadius: 1)
                          ],
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Row(children: [
                        Radio(
                          activeColor: Colors.black,
                            value: 'male',
                            groupValue: groupval,
                            onChanged: (val) {
                              setState(() {
                                groupval = val!;
                              });
                            }),
                            const Text('Male',style: TextStyle(fontSize: 15),),
                            Radio(
                          activeColor: Colors.black,
                            value: 'female',
                            groupValue: groupval,
                            onChanged: (val) {
                              setState(() {
                                groupval = val!;
                              });
                            }),
                            const Text('female',style: TextStyle(fontSize: 15),)
                      ]),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
