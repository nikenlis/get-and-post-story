
import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tugas2_moa/controllers/home_controller.dart';
import 'package:tugas2_moa/sevices/story_services.dart';
import 'package:tugas2_moa/shared/theme.dart';

class AddNewStoryController extends GetxController {
  late final StoryServices _service;

  @override
  void onInit() {
    super.onInit();
    _service = Get.put(StoryServices());
  }

  Future<void> AddNewStory(
      String description, File photo) async {
    final response =
        await _service.fetchAddNewStory(description, photo);

    if (response != null) {
      //todo : refresh stories
      Get.find<HomeController>().getAllStories();

      Get.defaultDialog(
          middleText: '${response.message}',
          textConfirm: 'OK',
          confirmTextColor: whiteColor,
          onConfirm: () {
            Get.back();
          });
    } else {
      Get.defaultDialog(
          middleText: 'Deskripsi harus di isi',
          textConfirm: 'OK',
          confirmTextColor: whiteColor,
          onConfirm: () {
            Get.back();
          });
    }
  }
}

class AddNewStoryPage extends StatefulWidget {
  const AddNewStoryPage({super.key});
  @override
  State<AddNewStoryPage> createState() => _AddNewStoryPageState();
}

class _AddNewStoryPageState extends State<AddNewStoryPage> {
  AddNewStoryController addNewStoryController =
      Get.put(AddNewStoryController());
  final descriptinController = TextEditingController(text: '');


  Uint8List? _image;
  File? selectedImage;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Story"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Stack(
          children: [
            _image != null
                ? CircleAvatar(
                    radius: 100, backgroundImage: MemoryImage(_image!))
                : const CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                  ),
            Positioned(
                bottom: -0,
                left: 140,
                child: IconButton(
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                    icon: const Icon(Icons.add_a_photo)))
          ],
                  ),
          
              const SizedBox(
                height: 50,
              ),
          
              Text(
              'Notes',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(height: 3),
            TextField(
              maxLines: 4,
              controller: descriptinController,
              decoration: const InputDecoration(
                hintText: 'Contoh : Lokasi saya di deket',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 11, vertical: 8),
                border: OutlineInputBorder(),
              ),
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
              const SizedBox(height: 20),
          
              
              ElevatedButton(
                onPressed: () async{
                  if (selectedImage != null) {
                    print(
                        'image path : ${selectedImage}');
                        await addNewStoryController.AddNewStory(descriptinController.text, selectedImage!);
                  }
                },
                child: const Text('Submit'),
              ),
        ],
      ),
    );
  }



  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                            ),
                            Text("Gallery")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                            ),
                            Text("Camera")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }



}
