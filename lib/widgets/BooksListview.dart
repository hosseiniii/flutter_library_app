import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_app/constants/urls.dart';
import 'package:flutter_library_app/models/book_model.dart';
import 'package:http/http.dart' as http;

import '../constants/color_constant.dart';
import '../models/popularbook_model.dart';
import '../pages/selected_book_page.dart';

class BooksListview extends StatefulWidget {
  @override
  _BooksListviewState createState() => _BooksListviewState();
}

class _BooksListviewState extends State<BooksListview> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: _fetchBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Book> data = snapshot.data;
          return _booksListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}


Future<List<Book>> _fetchBooks() async {

  final response = await http.get(mainURL + allBooks);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    return jsonResponse.map((book) => new Book.fromJson(book)).toList();
  } else {
    throw Exception("Failed to load books");
  }
}


ListView _booksListView(data) {
  return ListView.builder(
      padding: EdgeInsets.only(top: 25, left: 25, right: 25),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return _tile(context, data, index);
      });
}


Widget _tile(context, data, index) => GestureDetector(
  onTap: () {
    print(index);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SelectedBookPage(
                    book: data[index]
                )
        )
    );
  },
  child: Container(
    margin: EdgeInsets.only(bottom: 19),
    height: 81,
    width: MediaQuery
        .of(context)
        .size
        .width - 50,
    color: kBackgroundColor,
    child: Row(
      children: [
        Container(
          height: 81,
          width: 62,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: AssetImage(
                      populars[index%3].image)),
              color: kMainColor),
        ),
        SizedBox(
          width: 21,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data[index].name,
              style: TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              data[index].author,
              style: TextStyle(
                  color: kGreyColor, fontSize: 10),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              data[index].price.toString(),
              style: TextStyle(
                  color: kBlackColor, fontSize: 14),
            )
          ],
        )
      ],
    ),
  ),
);