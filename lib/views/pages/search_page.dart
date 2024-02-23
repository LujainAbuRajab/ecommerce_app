import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 8,),
        TextField(
              //u should remove the const to avoid problems
              decoration: InputDecoration(
                helperStyle: TextStyle(
                  color: AppColors.white,
                ),
                labelText: 'Find your donut!',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
      ],
    );
  }
}