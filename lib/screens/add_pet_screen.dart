import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_feeder/utils/colors.dart';
import 'package:pet_feeder/widgets/button_widget.dart';
import 'package:pet_feeder/widgets/drawer_widget.dart';
import 'package:pet_feeder/widgets/text_widget.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key});

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _breedController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Pet Feeder',
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Pet Name:',
                  fontSize: 16,
                  isBold: true,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Enter pet name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pet name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextWidget(
                  text: 'Pet Age:',
                  fontSize: 16,
                  isBold: true,
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(hintText: 'Enter pet age'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pet age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextWidget(
                  text: 'Pet Breed:',
                  fontSize: 16,
                  isBold: true,
                ),
                TextFormField(
                  controller: _breedController,
                  decoration:
                      const InputDecoration(hintText: 'Enter pet breed'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the pet breed';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextWidget(
                  text: 'Pet Image:',
                  fontSize: 16,
                  isBold: true,
                ),
                const SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: _image != null
                        ? Image.file(
                            _image!,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[700],
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ButtonWidget(
                    label: 'Submit',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                        final name = _nameController.text;
                        final age = _ageController.text;
                        final breed = _breedController.text;

                        // You can save this data to a database or perform other actions
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: TextWidget(
                              text: 'Pet added successfully!',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
