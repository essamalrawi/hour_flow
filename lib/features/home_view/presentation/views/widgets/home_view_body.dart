import 'package:flutter/material.dart';
import 'package:hour_flow/features/home_view/presentation/views/widgets/custom_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 26),
            CustomButton(),
            SizedBox(height: 13.44),
          ],
        ),
      ),
    );
  }
}
