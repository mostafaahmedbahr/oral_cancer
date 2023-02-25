
import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oral_cancer/view/types/web_view_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/constants/constants.dart';
import '../../models/type_item_model.dart';
import 'package:readmore/readmore.dart';

 class TypesScreen extends StatefulWidget {
    TypesScreen({Key? key, this.controller}) : super(key: key);

    final WebViewController? controller;

  @override
  State<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen> {
   List<TypeItemModel> types  = [
    TypeItemModel(
      typeContent:"Find in-depth information on the symptoms, diagnosis, and treatment of oral tongue cancer." ,
      typeNumber: "1",
      typeTitle: "Tongue Cancer",
      typeUrl: "https://www.cancerresearchuk.org/about-cancer/mouth-cancer/stages-types-grades/tongue-cancer/about#:~:text=Tongue%20cancer%20is%20a%20type,human%20papilloma%20virus%20(HPV).",
    ),
     TypeItemModel(
       typeContent: "Find in-depth information on the symptoms, diagnosis, and treatment of oral tongue cancer.",
       typeNumber: "2",
       typeTitle: "Lip Cancer",
       typeUrl: "https://www.mayoclinic.org/diseases-conditions/lip-cancer/symptoms-causes/syc-20355079",

     ),
     TypeItemModel(
       typeContent:"It is rare for cancer to begin in the hard palate, but when it does the most common sign is an ulcer on the roof of the mouth." ,
       typeNumber: "3",
       typeTitle: "Hard Palate Cancer",
       typeUrl: "https://www.mskcc.org/cancer-care/types/mouth/types-mouth/hard-palate#:~:text=Hard%20palate%20cancer%20is%20a,mouth%20and%20the%20nasal%20cavity.",

     ),
     TypeItemModel(
       typeContent: "Often mistaken for gingivitis, gum cancer is highly treatable when found early.",
       typeNumber: "4",
       typeTitle: "Gum Cancer",
       typeUrl: "https://www.mskcc.org/cancer-care/types/mouth/types-mouth/gum",

     ),
     TypeItemModel(
       typeContent: "Often mistaken for a canker sore, floor of mouth cancer begins in the horseshoe-shaped area under the tongue.",
       typeNumber: "5",
       typeTitle: "Floor of Mouth Cancer",
       typeUrl: "https://www.mskcc.org/cancer-care/types/mouth/types-mouth/floor-mouth#:~:text=Floor%20of%20mouth%20cancer%20is,often%20mistaken%20for%20canker%20sores.",

     ),
     TypeItemModel(
       typeContent: "Learn about the symptoms and treatment of buccal mucosa cancer, also called inner cheek cancer.",
       typeNumber: "6",
       typeTitle: "Buccal Mucosa Cancer",
       typeUrl: "https://my.clevelandclinic.org/health/diseases/23423-buccal-mucosa-inner-cheek-cancer#:~:text=What%20is%20buccal%20mucosa%20cancer,just%20behind%20your%20last%20teeth.",

     ),
    ];

   @override
  void initState() {
     if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(child: Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) => ExpansionTileCard(
            contentPadding:
            EdgeInsets.symmetric(horizontal: 20.w),
            animateTrailing: true,
            borderRadius: BorderRadius.circular(20.w),
            baseColor: Colors.white,
            expandedColor: Colors.white,
            leading : CircleAvatar(
              backgroundColor: primaryColor,
            child: Text("${types[index].typeNumber}",
              style: TextStyle(
                color: Colors.white,
                fontSize:   18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            title: Text("${types[index].typeTitle}",
              style: TextStyle(
                color: Colors.black87,
                fontSize:   18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 5,
            children: [
             const Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Text("${types[index].typeContent}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:  18.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return WebViewScreen(url: "${types[index].typeUrl}");
                  }));
                },
                child: Text("ReadMore..",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:  18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 20.h,
          ),
          itemCount: types.length,
    ),
    )
    );
  }
}
