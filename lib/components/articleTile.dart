import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final String? imgUrl;
  final String? title;

  const ArticleTile({Key? key,
     this.imgUrl,
     this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 10,bottom: 10),
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height/7,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
      ),
      child: Row(
        children: [
          _imageBox(imgUrl??"",context),
          Flexible(
            child: Center(
              child:
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text((title!.length>=80)? "${_textEllipsis(title!)}..." : title!,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _imageBox(String imgUrl, BuildContext context){
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/8,
      width: MediaQuery.of(context).size.width/4,
      child: imgUrl.length>=6?Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          )
        ),
      ):Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/noImg.png"),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }

  _textEllipsis(String txt){
    return txt.substring(0,77);
  }
}
