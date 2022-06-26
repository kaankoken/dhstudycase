import 'package:delivery_hero_flutter_study_case/infra/core/constants/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: AppColors.LIGHT_GREY,
      timeInSecForIosWeb: 1,
      textColor: AppColors.BLACK,
      fontSize: 12.0,
    );
  }

  static get cancel => Fluttertoast.cancel();
}
