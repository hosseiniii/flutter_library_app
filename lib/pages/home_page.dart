import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_library_app/constants/color_constant.dart';
import 'package:flutter_library_app/constants/urls.dart';
import 'package:flutter_library_app/models/book_model.dart';
import 'package:flutter_library_app/widgets/BooksListview.dart';
import 'package:flutter_library_app/models/popularbook_model.dart';
import 'package:flutter_library_app/pages/selected_book_page.dart';
import 'package:flutter_library_app/widgets/custom_tab_indicator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../models/newbook_model.dart';
import '../models/newbook_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Book> futureBook;
  List<Book> bookList;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 25, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "سلام، خوش آمدید",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: kGreyColor,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "نرم افزار مدیریت کتابخانه",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: kBlackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    height: 39,
                    margin: EdgeInsets.only(right: 25, left: 25, top: 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kLightGreyColor),
                    child: Stack(
                      children: [
                        TextField(
                          textDirection: TextDirection.rtl,
                          maxLengthEnforced: true,
                          style: TextStyle(
                            fontSize: 14,
                            color: kBlackColor,
                          ),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  right: 19, left: 50, bottom: 8),
                              border: InputBorder.none,
                              hintText: "جستجوی کتاب ...",
                              hintStyle: TextStyle(
                                color: kGreyColor,
                              )),
                        ),
                        Positioned(
                            left: 0,
                            child: SvgPicture.asset(
                                'assets/svg/background_search.svg')),
                        Positioned(
                          top: 8,
                          left: 9,
                          child: SvgPicture.asset(
                              'assets/icons/icon_search_white.svg'),
                        )
                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      height: 25,
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(right: 25),
                      child: DefaultTabController(
                          length: 3,
                          child: TabBar(
                              labelPadding: EdgeInsets.all(0),
                              indicatorPadding: EdgeInsets.all(0),
                              isScrollable: true,
                              labelColor: kBlackColor,
                              unselectedLabelColor: kGreyColor,
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Dana"),
                              unselectedLabelStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "Dana"),
                              indicator: RoundedRectangleTabIndicator(
                                  weight: 2, width: 15, color: kBlackColor),
                              tabs: [
                                Tab(
                                    child: Directionality(
                                      child: Container(
                                        child: Text("جدید"),
                                        margin: EdgeInsets.only(left: 15),
                                      ),
                                      textDirection: TextDirection.rtl,
                                    )),
                                Tab(
                                  child: Container(
                                    child: Text("پرمطالعه"),
                                    margin: EdgeInsets.only(left: 15),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    child: Text("کم مطالعه"),
                                    margin: EdgeInsets.only(left: 15),
                                  ),
                                ),
                              ])),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 21),
                    height: 210,
                    child: ListView.builder(
                        padding: EdgeInsets.only(right: 25, left: 6),
                        itemCount: newbooks.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 19),
                            height: 210,
                            width: 153,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kMainColor,
                              image: DecorationImage(
                                  image: AssetImage(newbooks[index%2].image)),
                            ),
                          );
                        }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25, top: 25),
                    child: Text(
                      "تمام کتاب‌ها",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  BooksListview()
                ],
              ),
            ),
          ),
        ));
  }
}
