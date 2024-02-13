// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';
// import 'package:owow_admin/src/provider/temp.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// import '../../core/constants/gap_constant.dart';
// import '../common/background.dart';
// import '../common/custom_button.dart';

// class AddDiscountsPage extends StatefulWidget {
//   const AddDiscountsPage({super.key});

//   @override
//   State<AddDiscountsPage> createState() => _AddDiscountsPageState();
// }

// class _AddDiscountsPageState extends State<AddDiscountsPage> {
//   final _campaignFormFormKey = GlobalKey<FormState>();

//   final _itemController = TextEditingController();
//   final _discountController = TextEditingController();
//   final _expiryDateController = TextEditingController();
//   final _couponCount = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: HomeBackground(
//         child: Center(
//           child: _rightLayout(context),
//         ),
//       ),
//     );
//   }

//   Widget _rightLayout(BuildContext context) {
//     return Form(
//       key: _campaignFormFormKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: 450,
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 60,
//             width: 700,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CustomGradientElevatedButton(
//                   minimumSize: const Size(200, 60),
//                   buttonText: Text(
//                     'Save',
//                     style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                         color: Theme.of(context).colorScheme.onPrimary,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () {
//                     if (_campaignFormFormKey.currentState!.validate()) {
//                       _campaignFormFormKey.currentState!.save();
//                       _addToDiscountList('${_itemController.text} '
//                           ' ${_discountController.text} discount');
//                       context.pop();
//                     }
//                   },
//                 ),
//                 GapConstant.w20,
//                 CustomGradientElevatedButton(
//                   minimumSize: const Size(200, 60),
//                   buttonText: Text(
//                     'Cancel',
//                     style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                         color: Theme.of(context).colorScheme.onPrimary,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () => context.pop(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _addToDiscountList(String text) =>
//       Provider.of<DiscountProvider>(context, listen: false).addDiscount(text);
// }
