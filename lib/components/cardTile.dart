import 'package:flutter/material.dart';


class CardTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String source;

  const CardTile({Key? key, required this.title, required this.imgUrl, required this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imgUrl.length>9 ? (NetworkImage(imgUrl) as ImageProvider<Object>) : const AssetImage("assets/noImg.png"),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Text(title,
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,),
      ),
    );
  }

  _imageBox({required String imgUrl, required BuildContext context}){
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/8,
      width: MediaQuery.of(context).size.width/4,
      decoration: BoxDecoration(
            image: DecorationImage(
              image: imgUrl.length>9 ? (NetworkImage(imgUrl) as ImageProvider<Object>) : AssetImage("assets/noImg.png"),
              fit: BoxFit.cover,
            )
        ),
    );
  }
}
