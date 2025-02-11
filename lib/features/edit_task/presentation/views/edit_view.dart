import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_images.dart';
import 'widgets/custom_edit_appbar.dart';
import 'widgets/edit_view_body.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static const String routeName = '/edit_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomEditAppBar(), body: SafeArea(child: EditViewBody()));
  }
}
