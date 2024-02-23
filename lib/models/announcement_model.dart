import 'package:ecommerce_app/utils/app_assets.dart';

class AnnouncementModel {
  final String id;
  final String imgUrl;

  AnnouncementModel({required this.id, required this.imgUrl});
}

List<AnnouncementModel> dummyAnnouncements = [
  AnnouncementModel(
    id: '1',
    imgUrl:
        AppAssets.banner1,
  ),
  AnnouncementModel(
    id: '2',
    imgUrl:
        AppAssets.banner2,
  ),
  AnnouncementModel(
    id: '3',
    imgUrl:
        AppAssets.banner3,
  ),
  AnnouncementModel(
    id: '4',
    imgUrl:
        AppAssets.banner4,
  ),
];
