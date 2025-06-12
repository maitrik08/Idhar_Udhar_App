import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class ProfilePhotoPicker {
  static void show(BuildContext context, Function(ImageProvider) onImageSelected) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      enableDrag: false,
      isDismissible: true,
      backgroundColor: const Color(0xFFE0E0E0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text("Select Profile Photo", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black)),
              ),
              _buildOption(
                icon: Icons.photo_outlined,
                label: "Choose from Gallery",
                onTap: () => _pickFromGallery(context, onImageSelected),
              ),
              _buildOption(
                icon: Icons.folder_open_sharp,
                label: "Choose from Files",
                onTap: () => _pickFromFiles(context, onImageSelected),
              ),
              _buildOption(
                icon: Icons.account_circle_outlined,
                label: "Select Vector / Avatar",
                onTap: () async {
                  Navigator.pop(context);
                  final result = await Navigator.pushNamed(context, '/avtarselection');
                  if (result is String) {
                    onImageSelected(AssetImage(result));
                  }
                },
              ),
              _buildOption(
                icon: Icons.camera_alt_outlined,
                label: "Take a Photo",
                onTap: () => _takePhoto(context, onImageSelected),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _buildOption({required IconData icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(color: Colors.black,fontSize: 13)),
      onTap: onTap,
    );
  }

  static Future<void> _pickFromGallery(BuildContext context, Function(ImageProvider) onImageSelected) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    if (pickedFile != null) {
      onImageSelected(FileImage(File(pickedFile.path)));
    }
  }

  static Future<void> _takePhoto(BuildContext context, Function(ImageProvider) onImageSelected) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    if (pickedFile != null) {
      onImageSelected(FileImage(File(pickedFile.path)));
    }
  }

  static Future<void> _pickFromFiles(BuildContext context, Function(ImageProvider) onImageSelected) async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    Navigator.pop(context);
    if (result != null && result.files.first.path != null) {
      onImageSelected(FileImage(File(result.files.first.path!)));
    }
  }
}
