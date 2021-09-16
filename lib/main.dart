import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photogallery/picture_detail.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoGalleryApp(),
  ));
  
}
class PhotoGalleryApp extends StatefulWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);

  @override
  _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
}

class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  // Image data source
  List img =[
    "https://images.unsplash.com/photo-1631541911156-0b44a12a7770?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1628191081698-44f573462a03?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1628191140046-8be8856fd011?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw0Mnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:12.0,vertical:10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text("Asimau Gallery App" ,
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold
          ),),
          SizedBox(height:18.0),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search,color: Colors.amber,),
              hintText: "search for Image",
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(0.0)
               )
            )
          ),
          SizedBox(height: 24.0,),
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: StaggeredGridView.countBuilder(
                 crossAxisCount: 2,
                 crossAxisSpacing: 12,
                 mainAxisSpacing: 12,
                 itemCount:img.length ,
                itemBuilder: (context,index) {
                  return Container(
                   decoration: BoxDecoration(
                   color: Colors.transparent,
                   borderRadius: BorderRadius.circular(0.0)
                  ),
                   child: GestureDetector(
                     onTap: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder :(context) =>PictureDetailScreen(img[index])),);
                     },
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),

                       child:Image.network(img[index],fit: BoxFit.fill,),
                       ),
                   ),
                     );

                 }, staggeredTileBuilder:(int index) {
                   return new StaggeredTile.count(1, index.isEven ?1.2 :2);
                },
            ),
          )),
            ],
          ),
        ),
      ),
    );
  }
}




