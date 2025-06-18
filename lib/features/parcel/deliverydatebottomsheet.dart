import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:idhar_udhar/features/parcel/pickupTruck/pickuptruckdeliverysnapshotsheet.dart';
import 'package:idhar_udhar/features/parcel/tataAce/tataacedeliverysnapshotsheet.dart';
import 'package:idhar_udhar/features/parcel/tempo/tempodeliverysnapshotsheet.dart';
import 'package:idhar_udhar/features/parcel/truck14Feet/truck14feetdeliverysnapshotsheet.dart';
import 'package:idhar_udhar/features/parcel/truck19Feet/truck19feetdeliverysnapshotsheet.dart';
import 'package:idhar_udhar/features/parcel/truck32Feet/truck32feetdeliverysnapshotsheet.dart';
import '../../core/constants/constants.dart';
import 'auto/autodeliverysnapshotsheet.dart';
import 'bike/bikedeliverysnapshotsheet.dart';
import 'canter/canterdeliverysnapshotsheet.dart';
import 'car/cardeliverysnapshotsheet.dart';
import 'containerTruck/containertruckdeliverysnapshotsheet.dart';
import 'dutyTruck/dutyTruckdeliverysnapshotsheet.dart';
import 'miniTruck/minitruckdeliverysnapshotsheet.dart';

class DeliveryDateBottomSheet extends StatefulWidget {
  const DeliveryDateBottomSheet({super.key});

  @override
  State<DeliveryDateBottomSheet> createState() => _DeliveryDateBottomSheetState();
}

class _DeliveryDateBottomSheetState extends State<DeliveryDateBottomSheet> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Container(
      height: size.height * 0.71,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Title
          Text(
            "When Should We Deliver Your Parcel?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 16 * textScale,
            ),
          ),
          const SizedBox(height: 30),

          // Delivery Date Field
          _customTextField(
            hint: "Enter Delivery Date",
            controller: _dateController,
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.dark(
                        primary: Colors.green,
                      ),
                      dialogBackgroundColor: Colors.black,
                    ),
                    child: child!,
                  );
                },
              );
              if (selectedDate != null) {
                _dateController.text =
                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
              }
            },
          ),

          const SizedBox(height: 16),

          // Time Field
          _customTextField(
            hint: "What Time Works Best?",
            controller: _timeController,
            onTap: () async {
              final selectedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.dark(
                        primary: AppColors.primary,
                      ),
                      timePickerTheme: TimePickerThemeData(
                        dialHandColor: AppColors.primary,
                        entryModeIconColor: AppColors.primary,
                        dayPeriodColor: AppColors.primary
                      ),
                      dialogBackgroundColor: Colors.white,
                    ),
                    child: child!,
                  );
                },
              );
              if (selectedTime != null) {
                _timeController.text = selectedTime.format(context);
              }
            },
          ),

          const Spacer(flex: 2),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                switch (rideType) {
                  case 'bike-parcel':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const BikeDeliverySnapshotContent(),
                    );
                    break;
                  case 'car-parcel':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const CarDeliverySnapshotContent(),
                    );
                    break;

                  case 'auto-parcel':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const AutoDeliverySnapshotContent(),
                    );
                    break;
                  case 'tata-ace':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const TataAceDeliverySnapshotContent(),
                    );
                    break;
                  case 'Pickup-Truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const PickupTruckDeliverySnapshotContent(),
                    );
                    break;
                  case 'mini-Truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const MiniTruckDeliverySnapshotContent(),
                    );
                    break;
                  case 'tempo':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const TempoDeliverySnapshotContent(),
                    );
                    break;
                  case 'canter':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const CanterDeliverySnapshotContent(),
                    );
                    break;
                  case '14feet-truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const Truck14feetDeliverySnapshotContent(),
                    );
                    break;
                  case '19feet-truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const Truck19feetDeliverySnapshotContent(),
                    );
                    break;
                  case 'duty-truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const DutyTruckDeliverySnapshotContent(),
                    );
                    break;
                  case '32feet-truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const Truck32feetDeliverySnapshotContent(),
                    );
                    break;
                  case 'container-truck':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const ContainerTruckDeliverySnapshotContent(),
                    );
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ride type not implemented')),
                    );

                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customTextField({
    required String hint,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
