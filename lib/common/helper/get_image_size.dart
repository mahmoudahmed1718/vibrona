import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageDimensions {
  final Size size;
  final bool isPortrait;

  ImageDimensions({required this.size, required this.isPortrait});
}

Future<ImageDimensions?> getImageSize(String imageUrl) async {
  try {
    ImageProvider imageProvider;

    // نتحقق إذا كان مسار ملف محلي أو network URL
    if (imageUrl.contains('http')) {
      // نجيب الكاش مانجر الافتراضي المستخدم داخل CachedNetworkImage
      final cacheManager = DefaultCacheManager();

      // نحاول نجيب الصورة من الكاش
      final fileInfo = await cacheManager.getFileFromCache(imageUrl);

      File file;
      if (fileInfo != null && fileInfo.file.existsSync()) {
        // لو موجودة في الكاش
        file = fileInfo.file;
      } else {
        // لو مش موجودة، نحملها ونضيفها للكاش
        final download = await cacheManager.downloadFile(imageUrl);
        file = download.file;
      }
      imageProvider = FileImage(file);
    } else {
      // ملف محلي - FileImage بيحترم EXIF orientation تلقائيًا
      imageProvider = FileImage(File(imageUrl));
    }

    // نستخدم ImageProvider اللي بيحترم EXIF orientation
    final imageStream = imageProvider.resolve(const ImageConfiguration());
    final completer = Completer<ui.Image>();

    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (info, _) {
        completer.complete(info.image);
        imageStream.removeListener(listener);
      },
      onError: (exception, stackTrace) {
        completer.completeError(exception);
        imageStream.removeListener(listener);
      },
    );

    imageStream.addListener(listener);
    final image = await completer.future;

    final size = Size(image.width.toDouble(), image.height.toDouble());
    final isPortrait = image.height > image.width;

    // مهم لتفادي memory leak
    image.dispose();

    return ImageDimensions(size: size, isPortrait: isPortrait);
  } catch (e) {
    debugPrint('Error getting image size: $e');
    return null;
  }
}
