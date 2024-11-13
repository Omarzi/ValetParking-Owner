
import '../../../utils/constants/exports.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: (){
            context.pop();
          },
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: VColors.greyScale500,
            child: Center(
              child: Icon(Icons.close,color: VColors.greyScale500,size: 20.sp,),
            ),
          ),
        ),
      ],
    );
  }
}