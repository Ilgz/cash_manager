// import 'package:chat/domain/core/locale_switcher/app_locale.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
//
// class CriticalFailureCard extends StatelessWidget {
//   const CriticalFailureCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             '😱',
//             style: TextStyle(fontSize: 100),
//           ),
//           Text(
//             "${AppLocale.unexpectedError.getString(context)}\n${AppLocale.pleaseContactSupport.getString(context)}",
//             style: const TextStyle(fontSize: 24),
//             textAlign: TextAlign.center,
//           ),
//           TextButton(
//             onPressed: () {},
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 const Icon(Icons.mail),
//                 const SizedBox(width: 4),
//                 Text(AppLocale.needHelp.getString(context)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
