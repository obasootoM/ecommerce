import 'package:ecommerce/common/custom_button.dart';
import 'package:ecommerce/common/custom_textfield.dart';
import 'package:ecommerce/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddresScreen extends StatefulWidget {
  const AddresScreen({super.key});

  @override
  State<AddresScreen> createState() => _AddresScreenState();
}

class _AddresScreenState extends State<AddresScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _flatController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _homeController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final provider = Provider.of<AuthProvider>(context).user.Address;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 1,
      ),
      body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                if (provider.isNotEmpty)
                  Column(
                    children: [
                      Container(
                        width: width * 0.93,
                        height: height * 0.07,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 0.3),
                                borderRadius: BorderRadius.circular(10))),
                        child: Center(
                          child: Text(
                            provider,
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text('OR',style: TextStyle(fontSize: 18),),
                CustomTextField(
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    text: 'Flat address'),
                CustomTextField(
                    controller: _flatController,
                    keyboardType: TextInputType.streetAddress,
                    text: 'street address'),
                CustomTextField(
                    controller: _pincodeController,
                    keyboardType: TextInputType.number,
                    text: 'pin code '),
                CustomTextField(
                    controller: _homeController,
                    keyboardType: TextInputType.streetAddress,
                    text: 'stown/state'),
                CustomButton(text: 'Buy with ', onTap: () {
                 if(_key.currentState!.validate()) {
                       
                 }
                })
              ],
            ),
          )),
    );
  }
}
