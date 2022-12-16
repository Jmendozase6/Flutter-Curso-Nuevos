import 'dart:io';

import 'package:flutter/material.dart';

Widget getImage(String? picture) {
  if (picture == null) {
    return Image.asset('assets/images/no-image.png', fit: BoxFit.cover);
  }

  if (picture.startsWith('http')) {
    return FadeInImage(
      image: NetworkImage(picture),
      placeholder: const AssetImage('assets/images/jar-loading.gif'),
      fit: BoxFit.cover,
    );
  }

  return Image.file(
    File(picture),
    fit: BoxFit.cover,
  );
}
