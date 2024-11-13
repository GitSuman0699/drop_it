import 'dart:io';

import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Icon
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E8EB),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[400]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: null,
              icon: Image.asset(
                TImages.loginGoogle,
                height: 25,
                width: 25,
              ),
              iconSize: 25,
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Facebook Icon
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E8EB),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey[400]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: null,
              icon: Image.asset(
                TImages.loginFacebook,
                height: 25,
                width: 25,
              ),
              iconSize: 25,
            ),
          ),
        ),
        if (Platform.isIOS) SpacerHelper.horizontalSpaceMedium(),
        // Apple Icon (Only for iOS)
        if (Platform.isIOS)
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E8EB),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey[400]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: null,
                icon: Image.asset(
                  TImages.loginApple,
                  height: 25,
                  width: 25,
                ),
                iconSize: 25,
              ),
            ),
          ),
      ],
    );
  }
}
