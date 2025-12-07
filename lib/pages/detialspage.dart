import 'package:end_project/models/details.dart';
import 'package:end_project/models/favorites_data.dart';
import 'package:end_project/widgets/texsts_style.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({super.key, required this.dets, required this.mountIndex});
  final Details dets;
  final int mountIndex;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  int _selectednum = 0;
  bool isFavorite = false;
  // List favoriteList = [];
  @override
void initState() {
  super.initState();
  isFavorite = FavoritesData.favoriteNames.contains(widget.dets.name);

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            //الصورة
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${widget.dets.image}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // زر العودة
            Positioned(
              top: 40,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.deepPurple),
                ),
              ),
            ),

            // المعلومات
            Positioned(
              top: 320,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 550,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //الاسم و السعر
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BoldStyle(text: "${widget.dets.name}"),
                        BoldColordStyle(
                          text: "${widget.dets.price}\$",
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                    // الموقع
                    Row(
                      children: [
                        Icon(Icons.place, color: Colors.deepPurple),
                        SizedBox(width: 10),
                        NormalStyle(text: "${widget.dets.location}"),
                      ],
                    ),
                    SizedBox(height: 10),
                    // التقييم
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index + 1 <= widget.dets.rating
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.deepPurple,
                        );
                      }),
                    ),
                    SizedBox(height: 10),
                    //عدد الأشخاص
                    BoldStyle(text: "People"),
                    NormalStyle(text: "Number of people in your group"),
                    SizedBox(height: 15),
                    Row(
                      children: List.generate(5, (i) {
                        bool isSelected = _selectednum == i;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectednum = i;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "${i + 1}",
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    // الوصف
                    SizedBox(height: 15),
                    BoldStyle(text: "Descrption"),
                    Container(
                      width: 300,
                      child: NormalStyle(text: "${widget.dets.desc}"),
                    ),
                    SizedBox(height: 20),
                    // المفضلة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
    setState(() {
      isFavorite = !isFavorite;

      if (isFavorite) {
        if (!FavoritesData.favoriteNames.contains(widget.dets.name)) {
          FavoritesData.favoriteNames.add(widget.dets.name);
        }
      } else {
        FavoritesData.favoriteNames.remove(widget.dets.name);
      }
    });
  },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 230, 228, 228),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 35,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                        // زر الحجز
                        MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: BoldStyle(text: "Book Information"),
                                  content: Container(
                                    width: 250,
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MidStyle(
                                          text: "mountain: ${widget.dets.name}",
                                        ),
                                        MidStyle(
                                          text:
                                              "number of people: ${_selectednum + 1}",
                                        ),
                                        MidStyle(
                                          text:
                                              "total price: ${widget.dets.price * (_selectednum + 1)}\$",
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cancel"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          color: Colors.deepPurple,
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 15,
                            bottom: 15,
                            right: 10,
                          ),
                          child: Text(
                            "Book Trip Now       >>>",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
