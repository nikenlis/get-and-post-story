

import 'package:flutter/material.dart';

import 'package:tugas2_moa/shared/theme.dart';
import 'package:tugas2_moa/ui/pages/more_detail_story.dart';

class StoryItem extends StatelessWidget {
  String id;
  String imgUrl;
  String description;
  StoryItem({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.description
  });
  

  @override
  Widget build(BuildContext context) {
    var widthMediaQuery = MediaQuery.of(context).size.width;
    var heightMediaQuery = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
         showDialog(
            context: context,
            builder: (context) => MoreDetailStory(id: id));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 24, right: 24),
        padding: const EdgeInsets.all(10),
        width: 0,
        height: heightMediaQuery/3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
         color: purpleColor2
        ),
        child: Column(
          children: [
            Container(
              width: widthMediaQuery/2-50, 
              height: heightMediaQuery/3-100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(image: NetworkImage(imgUrl),)
              ),
            ),
            const SizedBox(height: 15,),
            Text(description, style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium), maxLines: 4, overflow: TextOverflow.ellipsis,),
      
          ],
        ),
      ),
    );
  }
}
