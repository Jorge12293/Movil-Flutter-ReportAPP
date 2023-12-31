import 'package:app_report/ui/resources/app_colors.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  final String title;
  const LoaderWidget({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        child: Container(
          padding:const EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              const SizedBox(height: 5),
              const Icon(Icons.computer,size: 40,color: AppColors.contentColorWhite),
              const SizedBox(height:5),
              Text(title,style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height:20),
              const CircularProgressIndicator(
                color: AppColors.contentColorGrey,
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}