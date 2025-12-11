import 'package:flutter/material.dart';
import 'package:vibrona/common/helper/app_network_image.dart';
import 'package:vibrona/common/helper/is_dark_mode.dart';
import 'package:vibrona/core/config/constant/app_urls.dart';
import 'package:vibrona/core/config/theme/app_colors.dart';
import 'package:vibrona/domain/entites/songs/song_entity.dart';

class NewSongItem extends StatelessWidget {
  const NewSongItem({super.key, required this.songs});
  final SongEntity songs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          AppNetworkImage(
            imageUrl:
                "${AppUrls.supabaseStorageUrl}${AppUrls.supabaseImagesBucket}${songs.artist.trim()}.png",

            width: 180,
            height: 180,
            fit: BoxFit.cover,
          ),

          PositionedDirectional(
            top: 150,
            end: 0,
            child: Container(
              height: 40,
              width: 40,
              transform: Matrix4.translationValues(10, 10, 0),
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: context.isDarkMode
                    ? AppColors.darkGray
                    : Color(0xffE6E6E6),
              ),
              child: Icon(
                Icons.play_arrow,
                color: context.isDarkMode
                    ? Color(0xff959595)
                    : Color(0xff555555),
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 25,
            child: Text(
              songs.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            child: Text(
              songs.artist,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
