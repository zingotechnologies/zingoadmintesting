import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zingoadmin/ui/backgroundCircles.dart';

// ignore: must_be_immutable
class Media extends StatefulWidget {

  List<File> imageList= List<File>();

  Media({
    Key key,
    @ required this.imageList
  }) : super(key: key);

  @override
  _MediaState createState() => _MediaState();
}

class _MediaState extends State<Media> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context){
    return Stack(
      children: <Widget>[
        backgroundCircles(),
        ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const  EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop(widget.imageList);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 8),
                                  blurRadius: 6.5
                              )
                            ]
                        ),
                        child: CircleAvatar(
                          radius: 27.0,
                          backgroundColor: Colors.blueGrey,
                          child: Center(
                            child: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 30.0),
            widget.imageList.length == 0 ?_buildStack() : _buildImageList(context),
            widget.imageList.length == 0 ? SizedBox(height: 10.0) : SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _camera(context),
                  SizedBox(width: 50.0),
                  _gallery()
                ],
              ),
            ),
            SizedBox(height: 50.0)
          ],
        )
      ],
    );
  }

  Widget _buildImageList(BuildContext context){
    return Container(
      height: 350.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imageList.length,
        itemBuilder: (context, index){
          return _buildItem(widget.imageList, index, context);
        },
      ),
    );
  }

  Widget _buildItem(List<File> images, int index, BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: GestureDetector(
        onTap: (){
          print(index.toString());
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => FileView(images: images, currentIndex: index)
          ).then((value){
            if(value == null){
              setState(() {
                widget.imageList;
              });

            }
            return widget.imageList;
          });
        },
        onLongPress: (){
          _deleteFile();
        },
        child: Container(
          height: 350.0,
          width: 250.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image: DecorationImage(
                  image: FileImage(images[index]),
                fit: BoxFit.cover
              )
          ),
        ),
      ),
    );
  }

  Widget _camera(BuildContext context) {

    return GestureDetector(
      onTap: (){
        _takePicture(context);
      },
      child: Container(
        height: 75.0,
        width: 75.0,
        decoration: BoxDecoration(
            color: Color(0xff6a84c8),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 8),
                  blurRadius: 6.5
              )
            ]
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.linked_camera, color: Colors.white),
              SizedBox(height: 5.0),
              Text("Camera", style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _takePicture(BuildContext context) async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    File file = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CameraPicture(camera: firstCamera)));

    if(file != null){
      setState(() {
        widget.imageList.add(file);
      });
    }

  }

  Widget _gallery(){
    return GestureDetector(
      onTap: (){
        _getGalleryPictures();
      },
      child: Container(
        height: 75.0,
        width: 75.0,
        decoration: BoxDecoration(
            color: Color(0xff6a84c8),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 8),
                  blurRadius: 6.5
              )
            ]
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.photo, color: Colors.white),
              SizedBox(height: 5.0),
              Text("Gallery", style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  _getGalleryPictures() async {
    File path;
    try {
      path = await FilePicker.getFile(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png', 'jpeg', 'avi', 'wmv', 'mp4']
      );
    } catch(e){
      print(e);
    }

    if(path != null){
      setState(() {
        widget.imageList.add(path);
      });
    }

    return widget.imageList;
  }

  Widget _buildStack(){

    String text = "We advice you take the utmost attention in uploading pictures of your facility. Hire a professional photographer if needs be. Edit and perfect your pictures, as your fist impression counts";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
          height: 400.0,
          width: double.infinity,
          child: Center(
            child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 75.0,
                    left: 0,
                    right: 0,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                        height: 280.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 8),
                                  blurRadius: 6.5
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18.0), maxLines: 6,),
                            SizedBox(height: 30.0),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                height: 30.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                    color: Color(0xff6a84c8),
                                    borderRadius: BorderRadius.circular(10.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 5),
                                          blurRadius: 6.5
                                      )
                                    ]
                                ),
                                child: Center(
                                  child: Text("GET ASSISTANCE", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: CircleAvatar(
                      radius: 75.0,
                      child: Center(child: FlareActor('assets/fingerprint.flr', animation: 'forward', fit: BoxFit.contain)),
                    ),
                  )
                ]
            ),
          )
      ),
    );
  }

  void _deleteFile(){

  }

}

// ignore: must_be_immutable
class CameraPicture extends StatefulWidget {

  final CameraDescription camera;

  CameraPicture({
    Key key,
    this.camera
  }) : super(key: key);

  @override
  _CameraPictureState createState() => _CameraPictureState();
}

class _CameraPictureState extends State<CameraPicture> {

  CameraController _cameraController;
  Future<void> _initializeController;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.max
    );
    _initializeController = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeController,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return CameraPreview(_cameraController);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera, color: Colors.white),
        onPressed: () async {
          try {
            await _initializeController;
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png'
            );
            await _cameraController.takePicture(path);

            File file = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPicture(imagePath: path)));
            Navigator.of(context).pop(file);
          } catch(e){
            print(e);
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ViewPicture extends StatelessWidget {

  final String imagePath;
  List<File> imageList;

  ViewPicture({
    Key key,
    this.imagePath,
    this.imageList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.clear, color: Colors.white),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done, color: Colors.white),
            onPressed: (){
              Navigator.of(context).pop(File(imagePath));
            },
          )
        ],
      ),
      body: Container(
      	height: MediaQuery.of(context).size.height,
      	width: MediaQuery.of(context).size.width,
      	decoration: BoxDecoration(
          color: Colors.blueGrey,
          image: DecorationImage(
            image: FileImage(File(imagePath)),
            fit: BoxFit.fill
          )
        )
      	)
    );
  }
}



// ignore: must_be_immutable
class FileView extends StatefulWidget {

  List<File> images = List<File>();
  int currentIndex;

  FileView({
    @required this.images,
    @required this.currentIndex
  });

  @override
  _FileViewState createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {

  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: widget.currentIndex,
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
      backgroundColor: Colors.transparent,
      body: _buildBody(context),
    );
  }

  List<File> _delete(int index){
    setState(() {
      widget.images.removeAt(index);
    });
    return widget.images;
  }


  Widget _buildBody(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Align(
        alignment: Alignment.center,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            height: MediaQuery.of(context).size.height - 60.0,
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.black38,
                    child: Center(
                      child: Icon(Icons.clear, color: Colors.white)
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Stack(
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
                          return _buildPage(widget.images[index]);
                        },
                      ),
                      Positioned(
                        bottom: 10.0,
                        right: 0,
                        left: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildIndicator(),
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 15.0),
                GestureDetector(
                  onTap: (){
                    _delete(currentIndex);
                  },
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.black38,
                    child: Center(
                        child: Icon(Icons.delete, color: Colors.red)
                    ),
                  ),
                )
              ],
            )
          )
        ),
      ),
    );
  }

  Widget _buildPage(File image){
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              image: DecorationImage(
                  image: FileImage(image),
                  fit: BoxFit.contain
              )
          ),
        )
      ],
    );
  }

  Widget _indicatorCheck(bool check){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: 4.0,
        width: check ? 15.0 : 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          color: Colors.deepOrangeAccent,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 2
            )
          ]
        ),
      ),
    );
  }

  List<Widget> _buildIndicator(){
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

}
