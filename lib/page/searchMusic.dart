import 'package:chatmusicapp/models/playlist_provider.dart';
import 'package:chatmusicapp/models/song.dart';
import 'package:chatmusicapp/page/popupSongPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class searchMusic extends StatefulWidget {
  const searchMusic({Key? key}) : super(key: key);
  @override
  State<searchMusic> createState() => _searchMusicState();
}

class _searchMusicState extends State<searchMusic> {
  late final PlaylistProvider playlistProvider;
  String CurrentSongName = "";
  String CurrentIMage = "";
  int? CurrentIndex;
  String search = '';
  String songname = '';

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);

    if (playlistProvider.isPlaying == true) {
      playlistProvider.pauses();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (playlistProvider.isPlaying == true) {
      playlistProvider.pauses();
      playlistProvider.resume();
    } else {}
  }

  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;
    playlistProvider.pauses();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopupSong();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<PlaylistProvider>(builder: (context, value, child) {
              final List<Song> playlist = value.playlist;
              final currentSong = value.currentSongIndex != null
                  ? playlist[value.currentSongIndex!]
                  : null;
              return GestureDetector(
                onTap: () {
                  if (currentSong != null) {
                    goToSong(playlist.indexOf(currentSong));
                  }
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (currentSong != null) ...[
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(bottom: 8, left: 10, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        currentSong.albumArtImagePath,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 13),
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                    fontFamily: 'atma',
                                    fontSize: 20,
                                    color: Color(0xFFFF6B00),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: value.pauseOrResume,
                                  child: Container(
                                    child: Icon(
                                      playlistProvider.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Color(0xFFFF6B00),
                                      size: 40,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: value.playNextSong,
                                  child: Container(
                                    child: Icon(
                                      Icons.skip_next,
                                      color: Color(0xFFFF6B00),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (currentSong == null) ...[Container()],
                      Text(
                        'Search List',
                        style: TextStyle(
                          fontFamily: 'atma',
                          fontSize: 32,
                          color: Color(0xFFFF6B00),
                        ),
                      ),
                    ]),
              );
            }),
            Expanded(
              child: ListView.builder(
                itemCount: playlistProvider.playlist.length,
                itemBuilder: (context, index) {
                  final Song song = playlistProvider.playlist[index];
                  if (songname.isEmpty ||
                      song.songName
                          .toLowerCase()
                          .contains(songname.toLowerCase())) {
                    return ListTile(
                      title: Row(
                        children: [
                          Text(
                            '${index + 1} ',
                            style: TextStyle(
                              fontFamily: 'atma',
                              fontSize: 25,
                              color: Color(0xFFFF6B00),
                            ),
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            song.albumArtImagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.songName,
                                style: TextStyle(
                                  fontFamily: 'atma',
                                  color: Color(0xFFFF6B00),
                                ),
                              ),
                              Text(
                                song.artistName,
                                style: TextStyle(
                                  fontFamily: 'atma',
                                  color: Color(0xFFFF6B00),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            song.isFavorite = !song.isFavorite;
                            playlistProvider.updateFavoriteStatus(
                              index,
                              song.isFavorite,
                            );
                          });
                        },
                        child: Icon(
                          song.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: song.isFavorite
                              ? Color.fromARGB(255, 255, 60, 0)
                              : Color(0xFFFF6B00),
                          size: 35,
                        ),
                      ),
                      onTap: () {
                        goToSong((index));
                        playlistProvider.currentSongIndex = index;
                        print("index!! = ${index}");
                        setState(() {
                          CurrentSongName = song.songName;
                          CurrentIMage = song.albumArtImagePath;
                        });
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondary,
                          contentPadding: const EdgeInsets.all(6),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFFFF6B00),
                            fontSize: 14,
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: 20,
                              color: Color(0xFFFF6B00),
                            ),
                          ),
                        ),
                        onChanged: (val) {
                          setState(() {
                            songname = val;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.send,
                    color: Color(0xFFFF6B00),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
