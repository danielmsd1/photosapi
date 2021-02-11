import 'package:flutter/material.dart';
import 'package:photosapi/models/getJson.dart';

class ImageList extends StatelessWidget {
  final List<ParseImage> images;
  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return myCard(images[index]);
        });
  }

  Widget myCard(ParseImage image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, style: BorderStyle.solid),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          children: [
            Image.network(image.url),
            Text(image.title),
          ],
        ),
      ),
    );
  }
}
