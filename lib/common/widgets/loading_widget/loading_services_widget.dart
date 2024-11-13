// import 'package:valet_parking_user/utils/constants/constants.dart';
// import 'package:valet_parking_user/utils/constants/exports.dart';
//
// class LoadingServicesWidget extends StatelessWidget {
//   const LoadingServicesWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: VDeviceUtils.getScreenHeight(context) / 3.4,
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: 7,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   mainAxisSpacing: 24.w,
//                 crossAxisSpacing: VDeviceUtils.getScreenHeight(context) / 90,
//                 childAspectRatio: VDeviceUtils.getScreenHeight(context) / 1000,
//               ),
//               itemBuilder: (context, index) {
//
//                 return Shimmer.fromColors(
//                   baseColor: VColors.primaryColor100,
//                   highlightColor: Colors.transparent,
//                   child: Column(
//                     children: [
//                       ContainerIconsInServicesWidget(
//                         serviceIcon: VConstants.servicesIcons2[index],
//                         onTap: () {},
//                         servicesBgColors: VColors.purpleTransparent.withOpacity(.08),
//                       ),
//                       SizedBox(height: 12.h),
//                       Text('', style: VStyles.bodyLargeBold, overflow: TextOverflow.ellipsis,),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
