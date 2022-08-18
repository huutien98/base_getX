import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoadingMovieList extends StatelessWidget {
  const HomeLoadingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      itemBuilder: (context, index) {
        return _buildMovieLoadingItem();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 150,
          width: 8,
        );
      },
      itemCount: 50,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildMovieLoadingItem() {
    return Container(
      width: 100,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
