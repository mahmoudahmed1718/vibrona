import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vibrona/common/helper/get_image_size.dart';
import 'package:vibrona/core/config/theme/app_colors.dart';

class AppNetworkImage extends StatefulWidget {
  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.onImageLoaded,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final ValueChanged<ImageDimensions?>? onImageLoaded;

  @override
  State<AppNetworkImage> createState() => _AppNetworkImageState();
}

class _AppNetworkImageState extends State<AppNetworkImage> {
  bool _reportedLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl == null || widget.imageUrl!.isEmpty) {
      return _defaultErrorWidget();
    }

    return CachedNetworkImage(
      imageUrl: widget.imageUrl!,
      cacheKey: widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      maxWidthDiskCache: 800,
      maxHeightDiskCache: 800,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      filterQuality: FilterQuality.low,
      imageBuilder: (context, imageProvider) {
        if (!_reportedLoaded && widget.onImageLoaded != null) {
          _reportedLoaded = true;

          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final image = await getImageSize(widget.imageUrl!);
            if (mounted) {
              widget.onImageLoaded!(image);
            }
          });
        }

        return Image(
          image: imageProvider,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          filterQuality: FilterQuality.low,
          gaplessPlayback: true,
        );
      },
      placeholder: (_, _) => widget.placeholder ?? _defaultPlaceholder(),
      errorWidget: (_, _, _) => _defaultErrorWidget(),
    );
  }

  Widget _defaultPlaceholder() => Container(
    color: Colors.grey[200],
    child: const Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.primary,
      ),
    ),
  );

  Widget _defaultErrorWidget() => Container(
    color: Colors.grey[300],
    child: const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
  );
}
