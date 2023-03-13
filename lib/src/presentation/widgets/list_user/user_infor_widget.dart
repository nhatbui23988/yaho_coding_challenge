import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yaho_coding_challenge/src/data/model/user_information.dart';
import 'package:yaho_coding_challenge/src/resources/app_colors.dart';


class UserInforWidget extends StatelessWidget {
  const UserInforWidget(
      {Key? key, required this.userInformation, required this.index})
      : super(key: key);
  final UserInformation userInformation;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index % 2 != 0 ? kPrimaryLight : kLightSecondary,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
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
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userInformation.toName(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryText),
                  ),
                  Text(userInformation.email ?? '',
                      style: const TextStyle(fontSize: 18, color: kPrimaryText)),
                ],
              ),
            ))
          ],
        ));
  }
}
