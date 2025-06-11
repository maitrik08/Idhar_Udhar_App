import 'package:flutter/material.dart';
import '../../../core/themes/colors.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  List<Map<String, String>> addresses = [
    {"label": "Home", "details": "201/203, opp. 108 Call Center"},
    {"label": "Work", "details": "201/203, opp. 108 Call Center"},
    {"label": "GYM", "details": "201/203, opp. 108 Call Center"},
  ];

  void showAddressDialog({int? index}) {
    final isEdit = index != null;
    final TextEditingController labelController = TextEditingController(
        text: isEdit ? addresses[index!]['label'] : '');
    final TextEditingController detailsController = TextEditingController(
        text: isEdit ? addresses[index!]['details'] : '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF393939),
        title: Text(
          isEdit ? 'Edit Address' : 'Add Address',
          style: const TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: labelController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Place',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24)),
              ),
            ),
            TextField(
              controller: detailsController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white24)),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            onPressed: () {
              final label = labelController.text.trim();
              final details = detailsController.text.trim();

              if (label.isEmpty || details.isEmpty) return;

              setState(() {
                if (isEdit) {
                  addresses[index!] = {"label": label, "details": details};
                } else {
                  addresses.add({"label": label, "details": details});
                }
              });

              Navigator.pop(context);
            },
            child: Text(isEdit ? 'Update' : 'Add', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF393939),
        title: const Text("Delete Address", style: TextStyle(color: Colors.white)),
        content: Text(
          "Are you sure you want to delete '${addresses[index]['label']}'?",
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.white70)),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                addresses.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: const Text("Delete",style: TextStyle(color: Colors.red),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text("Address", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length + 1, // One extra for the add button
                itemBuilder: (context, index) {
                  if (index < addresses.length) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF264D2D),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.location_on, color: AppColors.primary),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  addresses[index]['label']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  addresses[index]['details']!,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => showAddressDialog(index: index),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.edit_outlined, color: Colors.white, size: 21),
                                ),
                              ),
                              InkWell(
                                onTap: () => confirmDelete(index),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(Icons.delete_outline, color: Colors.red, size: 21),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    // This is the last item: Add Address Button
                    return GestureDetector(
                      onTap: () => showAddressDialog(),
                      child: Container(
                        //margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 13),
                        decoration: BoxDecoration(
                          color: const Color(0xFF264D2D),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.add, color: AppColors.primary),
                            SizedBox(width: 12),
                            Text("Add Your address", style: TextStyle(color: Colors.white)),
                          ],
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
    );
  }
}
