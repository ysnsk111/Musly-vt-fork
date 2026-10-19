import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class PlayerUiSettingsService {
  static const String _keyShowVolumeSlider = 'player_show_volume_slider';
  static const String _keyShowStarRatings = 'player_show_star_ratings';
  static const String _keyShowMiniPlayerHeart = 'mini_player_show_heart';
  static const String _keyShowMiniPlayerRepeat = 'mini_player_show_repeat';
  static const String _keyShowMiniPlayerShuffle = 'mini_player_show_shuffle';
  static const String _keyAlbumArtCornerRadius = 'artwork_corner_radius';
  static const String _keyArtworkShape = 'artwork_shape';
  static const String _keyArtworkShadow = 'artwork_shadow';
  static const String _keyArtworkShadowColor = 'artwork_shadow_color';
  static const String _keyLiveSearch = 'search_live_search';
  static const String _keyLyricsBlurUnfocused = 'lyrics_blur_unfocused';
  static const String _keyLyricsAlignment = 'lyrics_alignment';
  static const String _keyLyricsGlowEffect = 'lyrics_glow_effect';
  static const String _keyShowLiveLyricUnderArtwork =
      'player_show_live_lyric_under_artwork';

  static const String _keyArtworkResolution = 'artwork_resolution';

  static final PlayerUiSettingsService _instance =
      PlayerUiSettingsService._internal();
  factory PlayerUiSettingsService() => _instance;
  PlayerUiSettingsService._internal();

  SharedPreferences? _prefs;

  final ValueNotifier<bool> showVolumeSliderNotifier = ValueNotifier(true);
  final ValueNotifier<bool> showStarRatingsNotifier = ValueNotifier(false);
  final ValueNotifier<bool> showMiniPlayerHeartNotifier = ValueNotifier(false);
  final ValueNotifier<bool> showMiniPlayerRepeatNotifier = ValueNotifier(false);
  final ValueNotifier<bool> showMiniPlayerShuffleNotifier =
      ValueNotifier(false);
  final ValueNotifier<bool> liveSearchNotifier = ValueNotifier(true);
  final ValueNotifier<double> albumArtCornerRadiusNotifier = ValueNotifier(8.0);

  final ValueNotifier<String> artworkShapeNotifier = ValueNotifier('rounded');
  final ValueNotifier<String> artworkShadowNotifier = ValueNotifier('soft');
  final ValueNotifier<String> artworkShadowColorNotifier = ValueNotifier('black');
  final ValueNotifier<String> artworkResolutionNotifier = ValueNotifier('normal');
  
  final ValueNotifier<bool> lyricsBlurUnfocusedNotifier = ValueNotifier(false);
  final ValueNotifier<String> lyricsAlignmentNotifier = ValueNotifier('left');
  final ValueNotifier<bool> lyricsGlowEffectNotifier = ValueNotifier(true);
  final ValueNotifier<bool> showLiveLyricUnderArtworkNotifier =
      ValueNotifier(false);
  static const String _keyLyricsSyncOffsetMs = 'lyrics_sync_offset_ms';
  final ValueNotifier<int> lyricsSyncOffsetMsNotifier = ValueNotifier(0);
  static const String _keySeekStepSeconds = 'player_seek_step_seconds';
  final ValueNotifier<int> seekStepSecondsNotifier = ValueNotifier(10);
  static const String _keyHapticFeedback = 'player_haptic_feedback';
  final ValueNotifier<bool> hapticFeedbackNotifier = ValueNotifier(true);

  static const String _keySkipSilence = 'player_skip_silence';
  final ValueNotifier<bool> skipSilenceNotifier = ValueNotifier(false);

  static const String _keyLyricsFontSize = 'player_lyrics_font_size';
  final ValueNotifier<double> lyricsFontSizeNotifier = ValueNotifier(22.0);

  static const String _keyWaveformProgress = 'player_waveform_progress';
  final ValueNotifier<bool> waveformProgressNotifier = ValueNotifier(false);

  static const String _keyNowPlayingBgAnimation = 'player_nowplaying_bg_anim';
  final ValueNotifier<bool> nowPlayingBgAnimationNotifier = ValueNotifier(true);

  Future<void> initialize() async {
    _prefs ??= await SharedPreferences.getInstance();
    showVolumeSliderNotifier.value = getShowVolumeSlider();
    showStarRatingsNotifier.value = getShowStarRatings();
    showMiniPlayerHeartNotifier.value = getShowMiniPlayerHeart();
    showMiniPlayerRepeatNotifier.value = getShowMiniPlayerRepeat();
    showMiniPlayerShuffleNotifier.value = getShowMiniPlayerShuffle();
    albumArtCornerRadiusNotifier.value = getAlbumArtCornerRadius();
    artworkShapeNotifier.value = getArtworkShape();
    artworkShadowNotifier.value = getArtworkShadow();
    artworkShadowColorNotifier.value = getArtworkShadowColor();
    artworkResolutionNotifier.value = getArtworkResolution();
    liveSearchNotifier.value = getLiveSearch();
    lyricsBlurUnfocusedNotifier.value = getLyricsBlurUnfocused();
    lyricsAlignmentNotifier.value = getLyricsAlignment();
    lyricsGlowEffectNotifier.value = getLyricsGlowEffect();
    showLiveLyricUnderArtworkNotifier.value = getShowLiveLyricUnderArtwork();
    lyricsSyncOffsetMsNotifier.value = getLyricsSyncOffsetMs();
    seekStepSecondsNotifier.value = getSeekStepSeconds();
    hapticFeedbackNotifier.value = getHapticFeedback();
    skipSilenceNotifier.value = getSkipSilence();
    lyricsFontSizeNotifier.value = getLyricsFontSize();
    waveformProgressNotifier.value = getWaveformProgress();
    nowPlayingBgAnimationNotifier.value = getNowPlayingBgAnimation();
  }

  Future<void> setShowLiveLyricUnderArtwork(bool show) async {
    await initialize();
    await _prefs!.setBool(_keyShowLiveLyricUnderArtwork, show);
    showLiveLyricUnderArtworkNotifier.value = show;
  }

  bool getShowLiveLyricUnderArtwork() {
    return _prefs?.getBool(_keyShowLiveLyricUnderArtwork) ?? false;
  }

  Future<void> setShowVolumeSlider(bool show) async {
    await initialize();
    await _prefs!.setBool(_keyShowVolumeSlider, show);
    showVolumeSliderNotifier.value = show;
  }

  bool getShowVolumeSlider() {
    return _prefs?.getBool(_keyShowVolumeSlider) ?? true;
  }

  Future<void> setShowStarRatings(bool show) async {
    await initialize();
    await _prefs!.setBool(_keyShowStarRatings, show);
    showStarRatingsNotifier.value = show;
  }

  bool getShowStarRatings() {
    return _prefs?.getBool(_keyShowStarRatings) ?? false;
  }

  Future<void> setShowMiniPlayerHeart(bool show) async {
    await initialize();
    await _prefs!.setBool(_keyShowMiniPlayerHeart, show);
    showMiniPlayerHeartNotifier.value = show;
  }

  bool getShowMiniPlayerHeart() {
    return _prefs?.getBool(_keyShowMiniPlayerHeart) ?? false;
  }

  Future<void> setShowMiniPlayerRepeat(bool show) async {
    await initialize();
    await _prefs!.setBool(_keyShowMiniPlayerRepeat, show);
    showMiniPlayerRepeatNotifier.value = show;
  }

  bool getShowMiniPlayerRepeat() {
    return _prefs?.getBool(_keyShowMiniPlayerRepeat) ?? false;
  }

  Future<void> setShowMiniPlayerShuffle(bool show) async {
    await initialize();
    await _prefs!.setBool(_keyShowMiniPlayerShuffle, show);
    showMiniPlayerShuffleNotifier.value = show;
  }

  bool getShowMiniPlayerShuffle() {
    return _prefs?.getBool(_keyShowMiniPlayerShuffle) ?? false;
  }

  Future<void> setAlbumArtCornerRadius(double radius) async {
    await initialize();
    await _prefs!.setDouble(_keyAlbumArtCornerRadius, radius);
    albumArtCornerRadiusNotifier.value = radius;
  }

  double getAlbumArtCornerRadius() {
    return _prefs?.getDouble(_keyAlbumArtCornerRadius) ?? 8.0;
  }

  Future<void> setArtworkShape(String shape) async {
    await initialize();
    await _prefs!.setString(_keyArtworkShape, shape);
    artworkShapeNotifier.value = shape;
  }

  String getArtworkShape() {
    return _prefs?.getString(_keyArtworkShape) ?? 'rounded';
  }

  Future<void> setArtworkShadow(String shadow) async {
    await initialize();
    await _prefs!.setString(_keyArtworkShadow, shadow);
    artworkShadowNotifier.value = shadow;
  }

  String getArtworkShadow() {
    return _prefs?.getString(_keyArtworkShadow) ?? 'soft';
  }

  Future<void> setArtworkShadowColor(String color) async {
    await initialize();
    await _prefs!.setString(_keyArtworkShadowColor, color);
    artworkShadowColorNotifier.value = color;
  }

  String getArtworkShadowColor() {
    return _prefs?.getString(_keyArtworkShadowColor) ?? 'black';
  }

  Future<void> setArtworkResolution(String resolution) async {
    await initialize();
    await _prefs!.setString(_keyArtworkResolution, resolution);
    artworkResolutionNotifier.value = resolution;
  }

  String getArtworkResolution() {
    return _prefs?.getString(_keyArtworkResolution) ?? 'normal';
  }

  Future<void> setLiveSearch(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keyLiveSearch, enabled);
    liveSearchNotifier.value = enabled;
  }

  bool getLiveSearch() {
    return _prefs?.getBool(_keyLiveSearch) ?? true;
  }

  Future<void> setLyricsBlurUnfocused(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keyLyricsBlurUnfocused, enabled);
    lyricsBlurUnfocusedNotifier.value = enabled;
  }

  bool getLyricsBlurUnfocused() {
    return _prefs?.getBool(_keyLyricsBlurUnfocused) ?? false;
  }

  Future<void> setLyricsAlignment(String alignment) async {
    await initialize();
    await _prefs!.setString(_keyLyricsAlignment, alignment);
    lyricsAlignmentNotifier.value = alignment;
  }

  String getLyricsAlignment() {
    return _prefs?.getString(_keyLyricsAlignment) ?? 'left';
  }

  Future<void> setLyricsGlowEffect(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keyLyricsGlowEffect, enabled);
    lyricsGlowEffectNotifier.value = enabled;
  }

  bool getLyricsGlowEffect() {
    return _prefs?.getBool(_keyLyricsGlowEffect) ?? true;
  }

  Future<void> setLyricsSyncOffsetMs(int offsetMs) async {
    await initialize();
    await _prefs!.setInt(_keyLyricsSyncOffsetMs, offsetMs);
    lyricsSyncOffsetMsNotifier.value = offsetMs;
  }

  int getLyricsSyncOffsetMs() {
    return _prefs?.getInt(_keyLyricsSyncOffsetMs) ?? 0;
  }

  Future<void> setSeekStepSeconds(int seconds) async {
    await initialize();
    await _prefs!.setInt(_keySeekStepSeconds, seconds);
    seekStepSecondsNotifier.value = seconds;
  }

  int getSeekStepSeconds() {
    return _prefs?.getInt(_keySeekStepSeconds) ?? 10;
  }

  Future<void> setHapticFeedback(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keyHapticFeedback, enabled);
    hapticFeedbackNotifier.value = enabled;
  }

  bool getHapticFeedback() {
    return _prefs?.getBool(_keyHapticFeedback) ?? true;
  }

  Future<void> setSkipSilence(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keySkipSilence, enabled);
    skipSilenceNotifier.value = enabled;
  }

  bool getSkipSilence() {
    return _prefs?.getBool(_keySkipSilence) ?? false;
  }

  Future<void> setLyricsFontSize(double size) async {
    await initialize();
    await _prefs!.setDouble(_keyLyricsFontSize, size);
    lyricsFontSizeNotifier.value = size;
  }

  double getLyricsFontSize() {
    return _prefs?.getDouble(_keyLyricsFontSize) ?? 22.0;
  }

  Future<void> setWaveformProgress(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keyWaveformProgress, enabled);
    waveformProgressNotifier.value = enabled;
  }

  bool getWaveformProgress() {
    return _prefs?.getBool(_keyWaveformProgress) ?? false;
  }

  Future<void> setNowPlayingBgAnimation(bool enabled) async {
    await initialize();
    await _prefs!.setBool(_keyNowPlayingBgAnimation, enabled);
    nowPlayingBgAnimationNotifier.value = enabled;
  }

  bool getNowPlayingBgAnimation() {
    return _prefs?.getBool(_keyNowPlayingBgAnimation) ?? true;
  }

  void dispose() {
    showStarRatingsNotifier.dispose();
    showMiniPlayerHeartNotifier.dispose();
    showMiniPlayerRepeatNotifier.dispose();
    showMiniPlayerShuffleNotifier.dispose();
    liveSearchNotifier.dispose();
    albumArtCornerRadiusNotifier.dispose();
    artworkShapeNotifier.dispose();
    artworkShadowNotifier.dispose();
    artworkShadowColorNotifier.dispose();
    artworkResolutionNotifier.dispose();
    lyricsBlurUnfocusedNotifier.dispose();
    lyricsAlignmentNotifier.dispose();
    lyricsGlowEffectNotifier.dispose();
    lyricsSyncOffsetMsNotifier.dispose();
    seekStepSecondsNotifier.dispose();
    hapticFeedbackNotifier.dispose();
    skipSilenceNotifier.dispose();
    lyricsFontSizeNotifier.dispose();
    waveformProgressNotifier.dispose();
    nowPlayingBgAnimationNotifier.dispose();
  }
}
