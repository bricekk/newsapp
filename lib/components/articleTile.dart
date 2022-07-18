import 'package:flutter/material.dart';

class ArticleTile extends StatelessWidget {
  final String? imgUrl;
  final String? title;
  final String? source;

  const ArticleTile({Key? key,
     this.imgUrl,
     this.title, this.source}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children:[ Container(
        margin: const EdgeInsets.only(top: 10,bottom: 10),
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height/7,
        child: Row(
          children: [
            _imageBox(imgUrl: imgUrl??"", context: context),
            Flexible(
              child: Center(
                child:
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text((title!.length>=103)? "${_textEllipsis(title!)}..." : title!,
                    style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 13),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
        Positioned(
            right: 6,
            bottom: 13,
            child: Text(source??"Unknown",
            style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 10),),
        )
    ]
    );
  }

  _imageBox({required String imgUrl, required BuildContext context}){
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/8,
      width: MediaQuery.of(context).size.width/4,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: imgUrl.length>9 ? (NetworkImage(imgUrl) as ImageProvider<Object>) : const AssetImage("assets/noImg.png"),
            fit: BoxFit.cover,
          )
      ),
    );
  }


  _textEllipsis(String txt){
    return txt.substring(0,100);
  }
}
