import 'package:drop_it/utils/constants/colors.dart';
import 'package:drop_it/utils/constants/image_strings.dart';
import 'package:drop_it/utils/constants/sizes.dart';
import 'package:drop_it/utils/constants/spacer_helper.dart';
import 'package:drop_it/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ClientRatingScreen extends StatefulWidget {
  const ClientRatingScreen({super.key});

  @override
  ClientRatingScreenState createState() => ClientRatingScreenState();
}

class ClientRatingScreenState extends State<ClientRatingScreen> {
  double _rating = 1; // Default rating
  final List<String> _selectedIssues = [];

  final List<String> _issues = [
    "Late Pickup",
    "Wrong Pickup Address",
    "Rough Behavior",
    "Didn't Receive Call",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Delivery Complete!',
              style: TTextTheme.lightTextTheme.headlineMedium!.copyWith(
                color: TColors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            SpacerHelper.verticalSpaceExtraLarge(),
            SpacerHelper.verticalSpaceExtraLarge(),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  TImages.clientImage), // Replace with your profile image
            ),
            const SizedBox(height: 10),
            Text(
              'David Stone',
              style: TTextTheme.lightTextTheme.titleLarge!.copyWith(
                color: TColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SpacerHelper.verticalSpaceLarge(),
            Text(
              'How was your experience with client?',
              style: TTextTheme.lightTextTheme.bodyLarge!.copyWith(
                color: TColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpacerHelper.verticalSpaceLarge(),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'What Went Wrong?',
              style: TTextTheme.lightTextTheme.titleMedium!.copyWith(
                color: TColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SpacerHelper.verticalSpaceMedium(),
            Wrap(
              spacing: 4,
              children: _issues.map((issue) {
                bool isSelected = _selectedIssues.contains(issue);
                return ChoiceChip(
                  label: Text(issue),
                  labelStyle: TextStyle(
                    color: isSelected ? TColors.black : Colors.white,
                  ),
                  selected: isSelected,
                  selectedColor: Colors.white,
                  backgroundColor: TColors.primary,
                  shape: const StadiumBorder(
                    side: BorderSide(color: Colors.white),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      isSelected
                          ? _selectedIssues.remove(issue)
                          : _selectedIssues.add(issue);
                    });
                  },
                );
              }).toList(),
            ),
            SpacerHelper.verticalSpaceExtraLarge(),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                    print("Rating: $_rating, Issues: $_selectedIssues");
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
