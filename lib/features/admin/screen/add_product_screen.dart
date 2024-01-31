import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/custom_button.dart';
import 'package:ecommerce/common/custom_textfield.dart';
import 'package:ecommerce/const/utilis.dart';
import 'package:ecommerce/features/admin/service/admin_service.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final AdminService adminService = AdminService();
  final _key = GlobalKey<FormState>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController =
      TextEditingController();
  final TextEditingController _priceEditingController = TextEditingController();
  final TextEditingController _quantityEditingController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _nameEditingController.dispose();
    _descriptionEditingController.dispose();
    _priceEditingController.dispose();
    _quantityEditingController.dispose();
  }
   void pickImage() async {
    var file = await pickFile();
    setState(() {
      images = file;
    });
  }
   String category = 'Bags';
  final List<String> productCategory = [
    'Bags',
    'Clothes',
    'New Arrival',
    'Shoes',
    'Electronics',
    'Jewelry'
  ];
  List<File> images = [];
  void sellProduct() {
    adminService.fetchProduct(
      context: context,
      name: _nameEditingController.text,
      description: _descriptionEditingController.text,
      quantity: double.parse(_quantityEditingController.text),
      images: images,
      category: category,
      price: double.parse(_priceEditingController.text),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        appBar: AppBar(
            elevation: 0.3,
            backgroundColor: Colors.grey[500],
            title: const Text('Add Your Product'),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                images.isNotEmpty
        ? CarouselSlider(
            items: images.map((e) {
              return Builder(
                  builder: (BuildContext context) => Image.file(
                        e,
                        fit: BoxFit.cover,
                        height: 200,
                      ));
            }).toList(),
            options: CarouselOptions(viewportFraction: 1,height: 200))
        : Container(
            width: width * 0.9,
            height: height * 0.2,
            decoration: ShapeDecoration(
                color: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child:
                        const Icon(Icons.folder, size: 50, color: Colors.grey)),
                const Text(
                  'select product images',
                  style: TextStyle(fontSize: 20),
                )
              ],
            )),
                CustomTextField(
                    controller: _nameEditingController,
                    keyboardType: TextInputType.text,
                    text: 'title'),
                CustomTextField(
                    maxLine: 3,
                    controller: _descriptionEditingController,
                    keyboardType: TextInputType.text,
                    text: 'description'),
                CustomTextField(
                    controller: _priceEditingController,
                    keyboardType: TextInputType.number,
                    text: 'price'),
                CustomTextField(
                    controller: _quantityEditingController,
                    keyboardType: TextInputType.number,
                    text: 'quantity'),
                SizedBox(
        width: double.infinity,
        child: DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down),
            value: category,
            onChanged: (String? value) {
              setState(() {
                category = value!;
              });
            },
            items: productCategory.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList()),
      ),
                const SizedBox(
                  height: 3,
                ),
                CustomButton(
                  text: 'submit',
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      sellProduct();
                    }
                  },
                  color: Colors.grey[500],
                )
              ],
            ),
          ),
        ));
  }
}
