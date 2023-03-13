import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';

import '../../../resources/app_colors.dart';

class UserInforGridItemWidget extends StatelessWidget {
  const UserInforGridItemWidget(
      {Key? key, required this.userInformation, required this.index})
      : super(key: key);
  final UserInformation userInformation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric( vertical: 12),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index % 2 != 0 ? kPrimaryLight : kLightSecondary,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CachedNetworkImage(
                  imageUrl: userInformation.avatar ?? '',
                  height: 100,
                  width: 100,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      userInformation.toName(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryText),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(userInformation.email ?? '',
                      style: const TextStyle(fontSize: 16, color: kPrimaryText))
                ],
              ),
            )
          ],
        ));
  }
}
