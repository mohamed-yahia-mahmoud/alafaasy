// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuranMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuranController on QuranMobx, Store {
  final _$myIconAtom = Atom(name: 'QuranMobx.myIcon');

  @override
  Icon get myIcon {
    _$myIconAtom.reportRead();
    return super.myIcon;
  }

  @override
  set myIcon(Icon value) {
    _$myIconAtom.reportWrite(value, super.myIcon, () {
      super.myIcon = value;
    });
  }

  final _$d1Atom = Atom(name: 'QuranMobx.d1');

  @override
  String get d1 {
    _$d1Atom.reportRead();
    return super.d1;
  }

  @override
  set d1(String value) {
    _$d1Atom.reportWrite(value, super.d1, () {
      super.d1 = value;
    });
  }

  final _$audioCacheAtom = Atom(name: 'QuranMobx.audioCache');

  @override
  AudioCache get audioCache {
    _$audioCacheAtom.reportRead();
    return super.audioCache;
  }

  @override
  set audioCache(AudioCache value) {
    _$audioCacheAtom.reportWrite(value, super.audioCache, () {
      super.audioCache = value;
    });
  }

  final _$audioPlayerAtom = Atom(name: 'QuranMobx.audioPlayer');

  @override
  AudioPlayer get audioPlayer {
    _$audioPlayerAtom.reportRead();
    return super.audioPlayer;
  }

  @override
  set audioPlayer(AudioPlayer value) {
    _$audioPlayerAtom.reportWrite(value, super.audioPlayer, () {
      super.audioPlayer = value;
    });
  }

  final _$my_durationAtom = Atom(name: 'QuranMobx.my_duration');

  @override
  Duration get my_duration {
    _$my_durationAtom.reportRead();
    return super.my_duration;
  }

  @override
  set my_duration(Duration value) {
    _$my_durationAtom.reportWrite(value, super.my_duration, () {
      super.my_duration = value;
    });
  }

  final _$my_positionAtom = Atom(name: 'QuranMobx.my_position');

  @override
  Duration get my_position {
    _$my_positionAtom.reportRead();
    return super.my_position;
  }

  @override
  set my_position(Duration value) {
    _$my_positionAtom.reportWrite(value, super.my_position, () {
      super.my_position = value;
    });
  }

  final _$my_sliderAtom = Atom(name: 'QuranMobx.my_slider');

  @override
  Duration get my_slider {
    _$my_sliderAtom.reportRead();
    return super.my_slider;
  }

  @override
  set my_slider(Duration value) {
    _$my_sliderAtom.reportWrite(value, super.my_slider, () {
      super.my_slider = value;
    });
  }

  final _$isSuraPlayingAtom = Atom(name: 'QuranMobx.isSuraPlaying');

  @override
  bool get isSuraPlaying {
    _$isSuraPlayingAtom.reportRead();
    return super.isSuraPlaying;
  }

  @override
  set isSuraPlaying(bool value) {
    _$isSuraPlayingAtom.reportWrite(value, super.isSuraPlaying, () {
      super.isSuraPlaying = value;
    });
  }

  final _$isSuraLoopingAtom = Atom(name: 'QuranMobx.isSuraLooping');

  @override
  bool get isSuraLooping {
    _$isSuraLoopingAtom.reportRead();
    return super.isSuraLooping;
  }

  @override
  set isSuraLooping(bool value) {
    _$isSuraLoopingAtom.reportWrite(value, super.isSuraLooping, () {
      super.isSuraLooping = value;
    });
  }

  final _$seekDoneAtom = Atom(name: 'QuranMobx.seekDone');

  @override
  bool get seekDone {
    _$seekDoneAtom.reportRead();
    return super.seekDone;
  }

  @override
  set seekDone(bool value) {
    _$seekDoneAtom.reportWrite(value, super.seekDone, () {
      super.seekDone = value;
    });
  }

  final _$currentIndexAtom = Atom(name: 'QuranMobx.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$surasIdAtom = Atom(name: 'QuranMobx.surasId');

  @override
  List<dynamic> get surasId {
    _$surasIdAtom.reportRead();
    return super.surasId;
  }

  @override
  set surasId(List<dynamic> value) {
    _$surasIdAtom.reportWrite(value, super.surasId, () {
      super.surasId = value;
    });
  }

  final _$suarsNamesAtom = Atom(name: 'QuranMobx.suarsNames');

  @override
  List<String> get suarsNames {
    _$suarsNamesAtom.reportRead();
    return super.suarsNames;
  }

  @override
  set suarsNames(List<String> value) {
    _$suarsNamesAtom.reportWrite(value, super.suarsNames, () {
      super.suarsNames = value;
    });
  }

  final _$QuranMobxActionController = ActionController(name: 'QuranMobx');

  @override
  void seekToSecond(int second) {
    final _$actionInfo =
        _$QuranMobxActionController.startAction(name: 'QuranMobx.seekToSecond');
    try {
      return super.seekToSecond(second);
    } finally {
      _$QuranMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void myInit() {
    final _$actionInfo =
        _$QuranMobxActionController.startAction(name: 'QuranMobx.myInit');
    try {
      return super.myInit();
    } finally {
      _$QuranMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<dynamic> getMySuraId() {
    final _$actionInfo =
        _$QuranMobxActionController.startAction(name: 'QuranMobx.getMySuraId');
    try {
      return super.getMySuraId();
    } finally {
      _$QuranMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getCurrentPositionTime(Duration d) {
    final _$actionInfo = _$QuranMobxActionController.startAction(
        name: 'QuranMobx.getCurrentPositionTime');
    try {
      return super.getCurrentPositionTime(d);
    } finally {
      _$QuranMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<QuranResponse> getQuranMethod(
      {QuranReq request,
      BuildContext context,
      void Function() doAfterSuccess}) {
    final _$actionInfo = _$QuranMobxActionController.startAction(
        name: 'QuranMobx.getQuranMethod');
    try {
      return super.getQuranMethod(
          request: request, context: context, doAfterSuccess: doAfterSuccess);
    } finally {
      _$QuranMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myIcon: ${myIcon},
d1: ${d1},
audioCache: ${audioCache},
audioPlayer: ${audioPlayer},
my_duration: ${my_duration},
my_position: ${my_position},
my_slider: ${my_slider},
isSuraPlaying: ${isSuraPlaying},
isSuraLooping: ${isSuraLooping},
seekDone: ${seekDone},
currentIndex: ${currentIndex},
surasId: ${surasId},
suarsNames: ${suarsNames}
    ''';
  }
}
