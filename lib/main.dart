import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:whatsapp_ui/camera_screen.dart';
import 'package:whatsapp_ui/mode_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData _lightTheme = ThemeData.light();
ThemeData _darkTheme = ThemeData.dark();
bool _themeToggle = false;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: !_themeToggle ? _lightTheme : _darkTheme,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              const SizedBox(width: 10),
              Icon(_themeToggle ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max_fill),
              /** Toggle Switch for dark mode */
              const SizedBox(width: 4),
              Switch(
                inactiveThumbColor: Colors.teal.shade500,
                activeColor: Colors.pinkAccent,
                value: _themeToggle,
                onChanged: (state) {
                  setState(() {
                    _themeToggle = state;
                  });
                },
              ),
              const SizedBox(width: 20),
              const Icon(CupertinoIcons.airplane),
              const SizedBox(width: 20),
              /**  Menu / More Button  **/
              Badge(
                padding: const EdgeInsets.all(4),
                position: BadgePosition.topEnd(top: 8, end: 0),
                child: PopupMenuButton(
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              value: '1',
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      CupertinoIcons.group_solid,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text("New Group"),
                                ],
                              )),
                          PopupMenuItem(
                              value: '2',
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.settings,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text("Setting"),
                                ],
                              )),
                          PopupMenuItem(
                              value: '3',
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: Icon(
                                      Icons.logout,
                                      size: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text("Logout"),
                                ],
                              )),
                          PopupMenuItem(
                              value: 4,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ModeScreen()),
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(right: 15.0),
                                      child: Icon(
                                        CupertinoIcons.moon_stars,
                                        size: 20,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text("Mode"),
                                  ],
                                ),
                              )),
                        ],
                    child: const Icon(CupertinoIcons.ellipsis_vertical)),
              ),
              const SizedBox(width: 15),
            ],
            // centerTitle: true,
            backgroundColor: Colors.teal.shade800,
            title: const Text('Whatsapp GB'),
            /** Tabs on bottom of AppBar */
            bottom: const TabBar(tabs: [
              Tab(child: Icon(CupertinoIcons.camera_fill)),
              Tab(child: Text("Chats", style: TextStyle(fontSize: 15))),
              Tab(child: Text('Status', style: TextStyle(fontSize: 15))),
              Tab(iconMargin: EdgeInsets.zero, child: Text('Calls', style: TextStyle(fontSize: 15)))
            ]),
          ),
          /** Views for Tabs **/
          body: TabBarView(
            children: [
              const Camera(),
              /** Chats Screen View */
              Scaffold(
                body: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/mypic.jpg'),
                      radius: 25,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('Nasir khan'),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: ReadMoreText(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an "
                        "unknown printer took a galley of type and scrambled it to make a type specimen book. "
                        "It has survived not only five centuries, but also the leap into electronic typesetting, "
                        "remaining essentially unchanged. It was popularised in the 1960s with the release of "
                        "Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing "
                        "software like Aldus PageMaker including versions of Lorem Ipsum",
                        trimCollapsedText: 'read more',
                        trimLines: 1,
                        trimMode: TrimMode.Line,
                        lessStyle: TextStyle(color: Colors.red),
                        moreStyle: TextStyle(color: Colors.red),
                        trimExpandedText: '. show less',
                      ),
                    ),
                    trailing: Text('12:05 PM'),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.teal.shade800,
                  child: const Icon(Icons.chat_rounded),
                ),
              ), //ListView for chats

              /** Status Screen View */
              Scaffold(
                body: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /** My status Tile*/
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all(width: 3, color: Colors.grey)),
                              child: const Padding(
                                padding: EdgeInsets.all(1),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/mypic.jpg'),
                                  radius: 30,
                                ),
                              ),
                            ),
                            title: const Text('My Status'),
                            subtitle: Row(
                              children: const [Text('Today, 09:00 AM')],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
                            child: Text(
                              'Recent Updates',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),

                          /**  Recent Statuses*/
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all(width: 2.5, color: Colors.green)),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/mypic.jpg'),
                                  radius: 30,
                                ),
                              ),
                            ),
                            title: const Text('Someone'),
                            subtitle: Row(
                              children: const [Text('Yesterday, 06:56 PM')],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, border: Border.all(width: 2.5, color: Colors.green)),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage('assets/Someone.jpg'),
                                  radius: 30,
                                ),
                              ),
                            ),
                            title: const Text('Someone'),
                            subtitle: Row(
                              children: const [Text('Yesterday, 06:56 PM')],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.teal.shade800,
                  child: const Icon(CupertinoIcons.camera_fill),
                ),
              ),

              /** Calls Screen View*/
              Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage('assets/Someone.jpg'),
                              radius: 20,
                            ),
                            title: const Text('Someone '),
                            subtitle: Row(
                              children: [
                                Icon(
                                  Icons.call_received_outlined,
                                  color: index % 2 == 1 ? Colors.green : Colors.red,
                                  size: 20,
                                ),
                                const Text('Yesterday 12:03 AM')
                              ],
                            ),
                            trailing: Icon(index % 2 == 1 ? Icons.call : Icons.videocam_rounded),
                          )),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.teal.shade800,
                  child: const Icon(Icons.add_call),
                ),
              ), //ListView for Calls
            ],
          ),
        ),
      ),
    );
  }
}

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  @override
  Widget build(BuildContext context) {
    return const CameraScreen();
  }
}
