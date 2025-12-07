
import 'package:end_project/models/allList.dart';
import 'package:end_project/models/favorites_data.dart';
import 'package:end_project/pages/detialspage.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {

    // أسماء الجبال المضافة للمفضلة
    final List<String> favoriteNames = FavoritesData.favoriteNames;

    // جميع الأماكن الأصلية
    final allPlaces = AllPlaces.all;

    // تصفية العناصر: نعرض فقط الموجود في المفضلة
    final favoriteTrips = allPlaces.where((place) {
      return favoriteNames.contains(place.name);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Trips"),
      ),

      body: favoriteTrips.isEmpty
          ? const Center(
              child: Text(
                "No Favorite Trips Yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: favoriteTrips.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 400,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, i) {

                  final trip = favoriteTrips[i];

                  return GestureDetector(
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailedPage(dets: trip, mountIndex: i),
                        ),
                      );

                      // تحديث الصفحة بعد الرجوع
                      setState(() {});
                    },

                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // الصورة
                          Container(
                            width: double.infinity,
                            height: 270,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage(trip.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // الاسم
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 5),
                            child: Text(
                              trip.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),

                          // التقييم
                          Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  index + 1 <= trip.rating
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.deepPurple,
                                );
                              }),
                            ),
                          ),

                          // السعر
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "${trip.price}\$",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
