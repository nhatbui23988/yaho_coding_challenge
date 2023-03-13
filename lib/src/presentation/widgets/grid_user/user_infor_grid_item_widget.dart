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
        padding: const EdgeInsets.symmetric( horizontal: 8),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index % 2 != 0 ? kPrimaryLight : kLightSecondary,
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
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
            Flexible(
              child: Text(
                userInformation.toName(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryText),
              ),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: Text(userInformation.email ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16, color: kPrimaryText)),
            )
          ],
        ));
  }
}
