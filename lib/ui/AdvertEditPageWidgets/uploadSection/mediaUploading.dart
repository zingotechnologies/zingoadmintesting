import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zingoadmin/pages/mediaUploadPage.dart';

// ignore: must_be_immutable
class MediaUpload extends StatefulWidget {

  List<File> imageList = List<File>();

  @override
  _MediaUploadState createState() => _MediaUploadState();
}

class _MediaUploadState extends State<MediaUpload> {

  _getImages() async {
    List<File> _images = await Navigator.push(context, MaterialPageRoute(builder: (context) => Media(imageList: widget.imageList)));
    setState(() {
      widget.imageList = _images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _getImages();
      },
      child: Container(
        height: 350.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: widget.imageList.length == 0 ? _emptyList() : SelfMadePictureCarousel(images: widget.imageList)
      )
    );
  }

  Widget _emptyList(){
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.blueGrey.withOpacity(0.5),
        child: Icon(Icons.add_a_photo, color: Colors.black38, size: 40.0),
        radius: 50.0,
      ),
    );
  }

}

// ignore: must_be_immutable
class SelfMadePictureCarousel extends StatefulWidget {

  List<File> images;

  SelfMadePictureCarousel({
    @required this.images
  });

  @override
  _SelfMadePictureCarouselState createState() => _SelfMadePictureCarouselState();
}

class _SelfMadePictureCarouselState extends State<SelfMadePictureCarousel> {

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        PageView.builder(
          itemCount: widget.images.length,
          onPageChanged: (int page){
            setState(() {
              currentIndex = page;
            });
          },
          controller: _pageController,
          itemBuilder: (context, index){
            return _buildPage(widget.images[index], context, index);
          },
        ),
        Positioned(
          bottom: 10.0,
          right: 0,
          left: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicators(),
          ),
        )
      ],
    );
  }

  Widget _buildPage(File image, BuildContext context, int index){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(image),
          fit: BoxFit.fill
        )
      ),
    );
  }

  List<Widget> _buildIndicators(){
    List<Widget> indicators = [];

    for(int i = 0; i < widget.images.length; i++){
      if(currentIndex == i){
        indicators.add(_indicatorCheck(true));
      } else {
        indicators.add(_indicatorCheck(false));
      }
    }

    return indicators;

  }

  Widget _indicatorCheck(bool check){
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 5.0,
      width: check ? 15.0 : 5.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.deepOrange,
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 2
          )
        ]
      ),
    );
  }

}
