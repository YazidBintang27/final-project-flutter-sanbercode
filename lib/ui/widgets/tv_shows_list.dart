import 'package:flutter/material.dart';
import 'package:moviestar/constant/app_constant.dart';
import 'package:moviestar/models/tv_shows_model.dart';

class TvShowsWidget extends StatelessWidget {
  final String category;
  final List<TvShowsModel> data;
  const TvShowsWidget({super.key, required this.category, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  "View all",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: SizedBox(
              height: MediaQuery.of(context).size.height / 3.7,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 160,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "${AppConstant.IMAGE_PATH}${item.posterPath}",
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
