import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(RingTheBell());

class RingTheBell extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Ring the bell',
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                primaryColorLight: Colors.white,
                scaffoldBackgroundColor: Colors.white
                
            ),
            home: RingTheBellPage(title: 'Ring The Bell'),
        );
    }
}

class RingTheBellPage extends StatefulWidget {
    RingTheBellPage({Key key, this.title}) : super(key: key);
    
    final String title;
    
    @override
    _RingTheBellState createState() => _RingTheBellState();
}

class _RingTheBellState extends State<RingTheBellPage> {
    bool isRingTheBell = false;
    AudioPlayer audioPlayer = new AudioPlayer();
    

    playLocal() async {
        int result = await audioPlayer.play('https://d1490khl9dq1ow.cloudfront.net/music/mp3preview/pachelbel-canon-in-d_zkn6oEVO.mp3');
        print('AUDIO PLAY : ${result}');
    }
    
    stopLocal() async {
        await audioPlayer.stop();
    }
    
    void toggleRingTheBell() {
        setState(() {
            isRingTheBell = !isRingTheBell;
            if(isRingTheBell) {
               playLocal();
            } else {
                stopLocal();
            }
        });
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            drawer: Drawer(
                child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                        // 첫번째 자식은 거의 DrawerHeader를 사용한다.
                        DrawerHeader(
                            child: Text(
                                'Ring a bell',
                                style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.indigo
                            ),
                        ),
                        ListTile(
                            title: Text('Type1'),
                            onTap:() {},
                        ),
                        ListTile(
                            title: Text('Type2'),
                            onTap:() {},
                        ),
                        ListTile(
                            title: Text('close'),
                            onTap:() {
                                // 사용자가 drawer를 열면 navigation stack에 drawer가 추가된다. 즉 drawer를 닫으려면 stack에서 닫을 drawer를 pop하면 된다.
                                Navigator.pop(context);
                            },
                        )
                    ]
                ),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset('assets/image/bells.jpg')
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: toggleRingTheBell,
                tooltip: 'Increment',
                child: Icon(isRingTheBell?Icons.stop:Icons.play_arrow),
            ),
        );
    }
}
