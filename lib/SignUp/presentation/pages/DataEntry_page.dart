import 'dart:io';
import 'package:air_travel/SignUp/presentation/widgets/TextField_widget.dart';
import 'package:air_travel/SignUp/presentation/widgets/appBar_SignUp_widget.dart';
import 'package:air_travel/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class DataEntryPage extends StatefulWidget {
  DataEntryPage({super.key});

  @override
  State<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  String? selected_region;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final List<String> regions = [
    'Toshkent',
    'Andijon',
    'Farg‘ona',
    'Namangan',
    'Buxoro',
    'Samarqand',
    'Qashqadaryo',
    'Xorazm',
    'Navoiy',
    'Surxondaryo',
    'Jizzax',
    'Sirdaryo',
    'Qoraqalpog‘iston',
  ];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSignupWidget(
        text: "Ma'lumotlarni kiriting",
        address: '/enter_the_code',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    radius: 70,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(
                      Icons.person,
                      color: Colors.grey.withOpacity(0.5),
                      size: 50,
                    )
                        : null,
                  ),
                ),
                SizedBox(height: 24),
                TextFieldItem(text: 'Ismingiz'),
                TextFieldItem(text: 'Familyangiz'),
                TextFieldItem(text: '+998 99 999 99 99'),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text("Viloyatlar"),
                    value: selected_region,
                    items: regions.map((region) {
                      return DropdownMenuItem(
                        value: region,
                        child: Text(region),
                      );
                    }).toList(),
                    onChanged: (YangiTanlov) {
                      setState(() {
                        selected_region = YangiTanlov;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/home');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.GreenMain),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                fixedSize: MaterialStateProperty.all(
                  Size(400, 58),
                ),
              ),
              child: Text(
                "Saqlash",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
