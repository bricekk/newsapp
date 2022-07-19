import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(),
      child:  TextField(
        cursorHeight: 21,
        cursorColor: Colors.grey,
        onChanged: (text){

        },
        decoration: InputDecoration(
          hintText: "Search news",
          suffixIcon: MaterialButton(
            minWidth: 20,
            onPressed: (){/*The keyboard should disappear*/},
              child:  Icon(Icons.search,color: Theme.of(context).textTheme.headline4?.color)),
          contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)!,width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Theme.of(context).textTheme.headline4?.color)! ,width: 2)
          )
        ),
      ),
    );
  }
}
