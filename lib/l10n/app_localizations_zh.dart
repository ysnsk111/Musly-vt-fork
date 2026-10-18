// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Musly';

  @override
  String get emulatorDetected => '检测到模拟器';

  @override
  String get emulatorNotAllowed => '本应用无法在模拟器上运行。\n请使用真实物理设备。';

  @override
  String get goodMorning => '早上好';

  @override
  String get goodAfternoon => '下午好';

  @override
  String get goodEvening => '晚上好';

  @override
  String get forYou => '为你推荐';

  @override
  String get quickPicks => '快速选择';

  @override
  String get discoverMix => '发现混音';

  @override
  String get recentlyPlayed => '最近播放';

  @override
  String get yourPlaylists => '你的歌单';

  @override
  String get favoritePlaylists => '收藏的歌单';

  @override
  String get sectionAlbums => '专辑';

  @override
  String get sectionEPs => 'EP';

  @override
  String get sectionSingles => '单曲';

  @override
  String get madeForYou => '为你制作';

  @override
  String get topRated => '评分最高';

  @override
  String get noContentAvailable => '暂无内容';

  @override
  String get tryRefreshing => '请刷新或检查服务器连接';

  @override
  String get refresh => '刷新';

  @override
  String get errorLoadingSongs => '加载歌曲出错';

  @override
  String get noSongsInGenre => '该分类没有歌曲';

  @override
  String get errorLoadingAlbums => '加载专辑出错';

  @override
  String get noTopRatedAlbums => '暂无评分最高的专辑';

  @override
  String get login => '登录';

  @override
  String get serverUrl => '服务器地址';

  @override
  String get username => '用户名';

  @override
  String get password => '密码';

  @override
  String get selectCertificate => '选择 TLS/SSL 证书';

  @override
  String failedToSelectCertificate(String error) {
    return '选择证书失败：$error';
  }

  @override
  String get serverUrlMustStartWith => '服务器地址必须以 http:// 或 https:// 开头';

  @override
  String get failedToConnect => '连接失败';

  @override
  String get library => '音乐库';

  @override
  String get search => '搜索';

  @override
  String get settings => '设置';

  @override
  String get albums => '专辑';

  @override
  String get artists => '艺术家';

  @override
  String get songs => '歌曲';

  @override
  String get playlists => '歌单';

  @override
  String get genres => '分类';

  @override
  String get years => '年份';

  @override
  String get favorites => '收藏';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get queue => '播放队列';

  @override
  String get lyrics => '歌词';

  @override
  String get play => '播放';

  @override
  String get pause => '暂停';

  @override
  String get next => '下一首';

  @override
  String get previous => '上一首';

  @override
  String get shuffle => '随机播放';

  @override
  String get repeat => '循环';

  @override
  String get repeatOne => '单曲循环';

  @override
  String get repeatOff => '关闭循环';

  @override
  String get addToPlaylist => '添加到歌单';

  @override
  String get removeFromPlaylist => '从歌单移除';

  @override
  String get addToFavorites => '添加到收藏';

  @override
  String get removeFromFavorites => '从收藏移除';

  @override
  String get download => '下载';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get ok => '确定';

  @override
  String get save => '保存';

  @override
  String get close => '关闭';

  @override
  String get general => '通用';

  @override
  String get appearance => '外观';

  @override
  String get playback => '播放';

  @override
  String get storage => '存储';

  @override
  String get about => '关于';

  @override
  String get darkMode => '深色模式';

  @override
  String get language => '语言';

  @override
  String get version => '版本';

  @override
  String get madeBy => '由 dddevid 开发';

  @override
  String get githubRepository => 'GitHub 仓库';

  @override
  String get reportIssue => '报告问题';

  @override
  String get joinDiscord => '加入 Discord 社区';

  @override
  String get unknownArtist => '未知艺术家';

  @override
  String get unknownAlbum => '未知专辑';

  @override
  String get playAll => '播放全部';

  @override
  String get shuffleAll => '随机播放全部';

  @override
  String get sortBy => '排序方式';

  @override
  String get sortByName => '名称';

  @override
  String get sortByArtist => '艺术家';

  @override
  String get sortByAlbum => '专辑';

  @override
  String get sortByDate => '日期';

  @override
  String get sortByDuration => '时长';

  @override
  String get ascending => '升序';

  @override
  String get descending => '降序';

  @override
  String get noLyricsAvailable => '暂无歌词';

  @override
  String get loading => '加载中...';

  @override
  String get error => '错误';

  @override
  String get retry => '重试';

  @override
  String get noResults => '无结果';

  @override
  String get searchHint => '搜索歌曲、专辑、艺术家...';

  @override
  String get allSongs => '全部歌曲';

  @override
  String get allAlbums => '全部专辑';

  @override
  String get allArtists => '全部艺术家';

  @override
  String trackNumber(int number) {
    return '第 $number 首';
  }

  @override
  String songsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 首歌曲',
      one: '1 首歌曲',
      zero: '无歌曲',
    );
    return '$_temp0';
  }

  @override
  String albumsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张专辑',
      one: '1 张专辑',
      zero: '无专辑',
    );
    return '$_temp0';
  }

  @override
  String get logout => '退出登录';

  @override
  String get confirmLogout => '确定要退出登录吗？';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get offlineMode => '离线模式';

  @override
  String get radio => '电台';

  @override
  String get changelog => '更新日志';

  @override
  String get platform => '平台';

  @override
  String get server => '服务器';

  @override
  String get display => '显示';

  @override
  String get playerInterface => '播放器界面';

  @override
  String get smartRecommendations => '智能推荐';

  @override
  String get showVolumeSlider => '显示音量滑块';

  @override
  String get showVolumeSliderSubtitle => '在正在播放界面显示音量控制';

  @override
  String get showStarRatings => '显示星级评分';

  @override
  String get showStarRatingsSubtitle => '为歌曲评分并查看评分';

  @override
  String get showMiniPlayerHeart => '显示收藏按钮';

  @override
  String get showMiniPlayerHeartSubtitle => '直接在迷你播放器中添加到喜欢';

  @override
  String get showMiniPlayerRepeat => '显示循环按钮';

  @override
  String get showMiniPlayerRepeatSubtitle => '在迷你播放器中切换循环模式';

  @override
  String get showMiniPlayerShuffle => '显示随机按钮';

  @override
  String get showMiniPlayerShuffleSubtitle => '在迷你播放器中切换随机播放';

  @override
  String get enableRecommendations => '启用推荐';

  @override
  String get enableRecommendationsSubtitle => '获取个性化音乐推荐';

  @override
  String get listeningData => '收听数据';

  @override
  String totalPlays(int count) {
    return '共播放 $count 次';
  }

  @override
  String get clearListeningHistory => '清除收听历史';

  @override
  String get confirmClearHistory => '这将重置您的所有收听数据和推荐。确定吗？';

  @override
  String get historyCleared => '收听历史已清除';

  @override
  String get discordStatus => 'Discord 状态';

  @override
  String get discordStatusSubtitle => '在 Discord 个人资料上显示正在播放的歌曲';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get systemDefault => '跟随系统';

  @override
  String get communityTranslations => '社区翻译';

  @override
  String get communityTranslationsSubtitle => '在 Crowdin 上帮助翻译 Musly';

  @override
  String get checkTranslationUpdates => '检查翻译更新';

  @override
  String get checkTranslationUpdatesSubtitle => '在线同步最新社区翻译 (OTA)';

  @override
  String get checkingTranslationUpdates => '正在检查翻译更新…';

  @override
  String get translationsUpdated => '翻译更新成功！';

  @override
  String get translationsUpToDate => '翻译已是最新版本';

  @override
  String get yourLibrary => '你的音乐库';

  @override
  String get filterAll => '全部';

  @override
  String get faves => '最爱';

  @override
  String get filterPlaylists => '歌单';

  @override
  String get filterAlbums => '专辑';

  @override
  String get filterArtists => '艺术家';

  @override
  String get likedSongs => '喜欢的歌曲';

  @override
  String get likedAlbums => '喜欢的专辑';

  @override
  String get noLikedAlbums => '暂无喜欢的专辑';

  @override
  String get localMusicLibrary => '本地音乐库';

  @override
  String get mergeLocalLibrary => '与服务器媒体库合并';

  @override
  String get mergeLocalLibrarySubtitle => '将本地音乐与服务器音乐库合并展示';

  @override
  String get localMusicStats => '本地音乐文件';

  @override
  String get addMusicFolder => '添加音乐文件夹';

  @override
  String get rescanLocalMusic => '重新扫描本地音乐';

  @override
  String get localLibraryEmpty => '音乐库为空';

  @override
  String get localLibraryEmptySubtitle => '未发现本地音乐文件。点击下方按钮重新扫描。';

  @override
  String get libraryEmpty => '媒体库为空';

  @override
  String get libraryEmptySubtitle => '添加一些歌曲开始体验吧。';

  @override
  String get scanForMusic => '扫描音乐';

  @override
  String get radioStations => '电台';

  @override
  String get playlist => '歌单';

  @override
  String get internetRadio => '网络电台';

  @override
  String get newPlaylist => '新建歌单';

  @override
  String get playlistName => '歌单名称';

  @override
  String get create => '创建';

  @override
  String get deletePlaylist => '删除歌单';

  @override
  String deletePlaylistConfirmation(String name) {
    return '确定要删除歌单「$name」吗？';
  }

  @override
  String playlistDeleted(String name) {
    return '歌单「$name」已删除';
  }

  @override
  String errorCreatingPlaylist(Object error) {
    return '创建歌单出错：$error';
  }

  @override
  String errorDeletingPlaylist(Object error) {
    return '删除歌单出错：$error';
  }

  @override
  String playlistCreated(String name) {
    return '歌单「$name」已创建';
  }

  @override
  String get searchTitle => '搜索';

  @override
  String get searchPlaceholder => '艺术家、歌曲、专辑';

  @override
  String get tryDifferentSearch => '尝试不同的搜索';

  @override
  String get noSuggestions => '无建议';

  @override
  String get browseCategories => '浏览分类';

  @override
  String get liveSearchSection => '搜索';

  @override
  String get liveSearch => '实时搜索';

  @override
  String get liveSearchSubtitle => '输入时即时刷新结果，而非显示下拉菜单';

  @override
  String get categoryMadeForYou => '为你制作';

  @override
  String get categoryNewReleases => '新歌首发';

  @override
  String get categoryTopRated => '评分最高';

  @override
  String get categoryGenres => '分类';

  @override
  String get categoryFavorites => '收藏';

  @override
  String get categoryRadio => '电台';

  @override
  String get settingsTitle => '设置';

  @override
  String get tabPlayback => '播放';

  @override
  String get tabStorage => '存储';

  @override
  String get tabServer => '服务器';

  @override
  String get tabDisplay => '显示';

  @override
  String get tabSupport => '支持';

  @override
  String get tabAbout => '关于';

  @override
  String get sectionAutoDj => '自动播放';

  @override
  String get autoDjMode => '自动播放模式';

  @override
  String songsToAdd(int count) {
    return '添加歌曲数：$count';
  }

  @override
  String get sectionReplayGain => '音量标准化 (REPLAYGAIN)';

  @override
  String get replayGainMode => '模式';

  @override
  String preamp(String value) {
    return '前置增益：$value dB';
  }

  @override
  String get preventClipping => '防止削波';

  @override
  String fallbackGain(String value) {
    return '备用增益：$value dB';
  }

  @override
  String get sectionStreamingQuality => '流媒体质量';

  @override
  String get enableTranscoding => '启用转码';

  @override
  String get qualityWifi => 'WiFi 质量';

  @override
  String get qualityMobile => '移动网络质量';

  @override
  String get format => '格式';

  @override
  String get transcodingSubtitle => '降低质量以减少数据使用';

  @override
  String get modeOff => '关闭';

  @override
  String get modeTrack => '单曲';

  @override
  String get modeAlbum => '专辑';

  @override
  String get sectionServerConnection => '服务器连接';

  @override
  String get serverType => '服务器类型';

  @override
  String get notConnected => '未连接';

  @override
  String get unknown => '未知';

  @override
  String get sectionMusicFolders => '音乐文件夹';

  @override
  String get musicFolders => '音乐文件夹';

  @override
  String get noMusicFolders => '未找到音乐文件夹';

  @override
  String get sectionSavedProfiles => '已保存的配置';

  @override
  String get switchProfile => '切换配置';

  @override
  String get switchServer => '切换服务器';

  @override
  String get addProfile => '添加配置';

  @override
  String switchProfileConfirmation(String profile) {
    return '确定要切换到此配置吗？当前播放队列将被重置。';
  }

  @override
  String get sectionAccount => '账户';

  @override
  String get logoutConfirmation => '确定要退出登录吗？这也将清除所有缓存数据。';

  @override
  String get sectionCacheSettings => '缓存设置';

  @override
  String get imageCache => '图片缓存';

  @override
  String get musicCache => '音乐缓存';

  @override
  String get bpmCache => 'BPM 缓存';

  @override
  String get saveAlbumCovers => '本地保存专辑封面';

  @override
  String get saveSongMetadata => '本地保存歌曲元数据';

  @override
  String get saveBpmAnalysis => '本地保存 BPM 分析';

  @override
  String get sectionCacheCleanup => '缓存清理';

  @override
  String get clearAllCache => '清除所有缓存';

  @override
  String get allCacheCleared => '所有缓存已清除';

  @override
  String get sectionOfflineDownloads => '离线下载';

  @override
  String get downloadedSongs => '已下载歌曲';

  @override
  String downloadingLibrary(int progress, int total) {
    return '正在下载音乐库... $progress/$total';
  }

  @override
  String get downloadAllLibrary => '下载全部音乐库';

  @override
  String downloadLibraryConfirm(int count) {
    return '这将下载 $count 首歌曲到您的设备。这可能需要一段时间并占用大量存储空间。\n\n是否继续？';
  }

  @override
  String get keepScreenOnDuringDownload => '下载时保持屏幕常亮';

  @override
  String get keepScreenOnDuringDownloadSubtitle => '下载大型媒体库时防止设备休眠';

  @override
  String get parallelDownloads => '并行下载';

  @override
  String get parallelDownloadsSubtitle => '同时下载多个音轨（消耗更多带宽）';

  @override
  String get downloadSingular => '个下载任务';

  @override
  String get downloadPlural => '个下载任务';

  @override
  String get slowerButStable => '单任务（稳定节省资源）';

  @override
  String get fasterButMoreData => '多任务（速度更快）';

  @override
  String get libraryDownloadStarted => '音乐库下载已开始';

  @override
  String get deleteDownloads => '删除所有下载';

  @override
  String get downloadsDeleted => '所有下载已删除';

  @override
  String get noSongsAvailable => '没有可用歌曲。请先加载您的音乐库。';

  @override
  String get sectionBpmAnalysis => 'BPM 分析';

  @override
  String get cachedBpms => '已缓存的 BPM';

  @override
  String get cacheAllBpms => '缓存所有 BPM';

  @override
  String get clearBpmCache => '清除 BPM 缓存';

  @override
  String get bpmCacheCleared => 'BPM 缓存已清除';

  @override
  String downloadedStats(int count, String size) {
    return '$count 首歌曲 • $size';
  }

  @override
  String get sectionInformation => '信息';

  @override
  String get sectionDeveloper => '开发者';

  @override
  String get sectionLinks => '链接';

  @override
  String get githubRepo => 'GitHub 仓库';

  @override
  String get playingFrom => '正在播放来自';

  @override
  String get live => '直播';

  @override
  String get streamingLive => '正在直播';

  @override
  String get stopRadio => '停止电台';

  @override
  String get removeFromLiked => '从喜欢的歌曲中移除';

  @override
  String get addToLiked => '添加到喜欢的歌曲';

  @override
  String get playNext => '下一首播放';

  @override
  String get addToQueue => '添加到队列';

  @override
  String get goToAlbum => '前往专辑';

  @override
  String get goToArtist => '前往艺术家';

  @override
  String get rateSong => '为歌曲评分';

  @override
  String rateSongValue(int rating, String stars) {
    return '为歌曲评分（$rating $stars）';
  }

  @override
  String get ratingRemoved => '评分已移除';

  @override
  String rated(int rating, String stars) {
    return '已评分 $rating $stars';
  }

  @override
  String get removeRating => '移除评分';

  @override
  String get downloaded => '已下载';

  @override
  String downloading(int percent) {
    return '正在下载... $percent%';
  }

  @override
  String get removeDownload => '移除下载';

  @override
  String get removeDownloadConfirm => '从离线存储中移除这首歌曲？';

  @override
  String get downloadRemoved => '下载已移除';

  @override
  String downloadedTitle(String title) {
    return '已下载「$title」';
  }

  @override
  String get downloadFailed => '下载失败';

  @override
  String downloadError(Object error) {
    return '下载错误：$error';
  }

  @override
  String addedToPlaylist(String title, String playlist) {
    return '已将「$title」添加到 $playlist';
  }

  @override
  String errorAddingToPlaylist(Object error) {
    return '添加到歌单出错：$error';
  }

  @override
  String get noPlaylists => '没有可用的歌单';

  @override
  String get createNewPlaylist => '创建新歌单';

  @override
  String artistNotFound(String name) {
    return '未找到艺术家「$name」';
  }

  @override
  String errorSearchingArtist(Object error) {
    return '搜索艺术家出错：$error';
  }

  @override
  String get selectArtist => '选择艺术家';

  @override
  String get removedFromFavorites => '已从收藏中移除';

  @override
  String get addedToFavorites => '已添加到收藏';

  @override
  String get star => '星';

  @override
  String get stars => '星';

  @override
  String get albumNotFound => '未找到专辑';

  @override
  String durationHoursMinutes(int hours, int minutes) {
    return '$hours 小时 $minutes 分钟';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String get topSongs => '热门歌曲';

  @override
  String get connected => '已连接';

  @override
  String get noSongPlaying => '当前无歌曲播放';

  @override
  String get internetRadioUppercase => '网络电台';

  @override
  String get playingNext => '即将播放';

  @override
  String get createPlaylistTitle => '创建歌单';

  @override
  String get playlistNameHint => '歌单名称';

  @override
  String playlistCreatedWithSong(String name) {
    return '已创建歌单「$name」并添加了这首歌曲';
  }

  @override
  String errorLoadingPlaylists(Object error) {
    return '加载歌单出错：$error';
  }

  @override
  String get playlistNotFound => '未找到歌单';

  @override
  String get noSongsInPlaylist => '该歌单中没有歌曲';

  @override
  String get noFavoriteSongsYet => '还没有喜欢的歌曲';

  @override
  String get noFavoriteAlbumsYet => '还没有喜欢的专辑';

  @override
  String get listeningHistory => '收听历史';

  @override
  String get noListeningHistory => '没有收听历史';

  @override
  String get songsWillAppearHere => '您播放的歌曲将显示在这里';

  @override
  String get sortByTitleAZ => '标题 (A-Z)';

  @override
  String get sortByTitleZA => '标题 (Z-A)';

  @override
  String get sortByArtistAZ => '艺术家 (A-Z)';

  @override
  String get sortByArtistZA => '艺术家 (Z-A)';

  @override
  String get sortByAlbumAZ => '专辑 (A-Z)';

  @override
  String get sortByAlbumZA => '专辑 (Z-A)';

  @override
  String get recentlyAdded => '最近添加';

  @override
  String get noSongsFound => '未找到歌曲';

  @override
  String get noAlbumsFound => '未找到专辑';

  @override
  String get noHomepageUrl => '没有可用的首页链接';

  @override
  String get playStation => '播放电台';

  @override
  String get openHomepage => '打开首页';

  @override
  String get copyStreamUrl => '复制流地址';

  @override
  String get failedToLoadRadioStations => '加载电台失败';

  @override
  String get noRadioStations => '没有电台';

  @override
  String get noRadioStationsHint => '在您的 Navidrome 服务器设置中添加电台以在此处查看。';

  @override
  String get connectToServerSubtitle => '连接到您的 Subsonic 服务器';

  @override
  String get pleaseEnterServerUrl => '请输入服务器地址';

  @override
  String get invalidUrlFormat => 'URL 必须以 http:// 或 https:// 开头';

  @override
  String get pleaseEnterUsername => '请输入用户名';

  @override
  String get pleaseEnterPassword => '请输入密码';

  @override
  String get legacyAuthentication => '旧版认证';

  @override
  String get legacyAuthSubtitle => '用于较旧的 Subsonic 服务器';

  @override
  String get allowSelfSignedCerts => '允许自签名证书';

  @override
  String get allowSelfSignedSubtitle => '用于具有自定义 TLS/SSL 证书的服务器';

  @override
  String get advancedOptions => '高级选项';

  @override
  String get customTlsCertificate => '自定义 TLS/SSL 证书';

  @override
  String get customCertificateSubtitle => '为使用非标准 CA 的服务器上传自定义证书';

  @override
  String get selectCertificateFile => '选择证书文件';

  @override
  String get clientCertificate => '客户端证书 (mTLS)';

  @override
  String get clientCertificateSubtitle => '使用证书对此客户端进行身份验证（需要支持 mTLS 的服务器）';

  @override
  String get selectClientCertificate => '选择客户端证书';

  @override
  String get clientCertPassword => '证书密码（可选）';

  @override
  String failedToSelectClientCert(String error) {
    return '选择客户端证书失败：$error';
  }

  @override
  String get connect => '连接';

  @override
  String get or => '或者';

  @override
  String get useLocalFiles => '使用本地文件';

  @override
  String get startingScan => '正在开始扫描...';

  @override
  String get storagePermissionRequired => '需要存储权限才能扫描本地文件';

  @override
  String get noMusicFilesFound => '在您的设备上未找到音乐文件';

  @override
  String get remove => '移除';

  @override
  String failedToSetRating(Object error) {
    return '设置评分失败：$error';
  }

  @override
  String get home => '首页';

  @override
  String get playlistsSection => '歌单';

  @override
  String get collapse => '收起';

  @override
  String get expand => '展开';

  @override
  String get createPlaylist => '创建歌单';

  @override
  String get likedSongsSidebar => '喜欢的歌曲';

  @override
  String playlistSongsCount(int count) {
    return '歌单 • $count 首歌曲';
  }

  @override
  String get failedToLoadLyrics => '加载歌词失败';

  @override
  String get lyricsNotFoundSubtitle => '无法找到这首歌曲的歌词';

  @override
  String get backToCurrent => '返回当前';

  @override
  String get exitFullscreen => '退出全屏';

  @override
  String get fullscreen => '全屏';

  @override
  String get noLyrics => '无歌词';

  @override
  String get internetRadioMiniPlayer => '网络电台';

  @override
  String get liveBadge => '直播';

  @override
  String get localFilesModeBanner => '本地文件模式';

  @override
  String get offlineModeBanner => '离线模式 - 仅播放已下载的音乐';

  @override
  String get updateAvailable => '有可用更新';

  @override
  String get updateAvailableSubtitle => '新版本的 Musly 已可用！';

  @override
  String updateCurrentVersion(String version) {
    return '当前版本：v$version';
  }

  @override
  String updateLatestVersion(String version) {
    return '最新版本：v$version';
  }

  @override
  String get whatsNew => '更新内容';

  @override
  String get downloadUpdate => '下载';

  @override
  String get remindLater => '稍后提醒';

  @override
  String get seeAll => '查看全部';

  @override
  String get artistDataNotFound => '未找到艺术家';

  @override
  String get addedArtistToQueue => '已将艺术家的所有歌曲添加到队列';

  @override
  String get addedArtistToQueueError => '添加艺术家歌曲到队列失败';

  @override
  String get casting => '投射中';

  @override
  String get dlna => 'DLNA';

  @override
  String get castDlnaBeta => '投射 / DLNA（测试版）';

  @override
  String get chromecast => 'Chromecast';

  @override
  String get dlnaUpnp => 'DLNA / UPnP 投屏';

  @override
  String get disconnect => '断开连接';

  @override
  String get searchingDevices => '正在搜索设备';

  @override
  String get castWifiHint => '请确保您的投射/DLNA设备\n处于同一 Wi-Fi 网络上';

  @override
  String connectedToDevice(String name) {
    return '已连接到 $name';
  }

  @override
  String failedToConnectDevice(String name) {
    return '连接到 $name 失败';
  }

  @override
  String get removedFromLikedSongs => '已从喜欢的歌曲中移除';

  @override
  String get addedToLikedSongs => '已添加到喜欢的歌曲';

  @override
  String get enableShuffle => '启用随机播放';

  @override
  String get enableRepeat => '启用循环';

  @override
  String get connecting => '正在连接';

  @override
  String get closeLyrics => '关闭歌词';

  @override
  String errorStartingDownload(Object error) {
    return '开始下载出错：$error';
  }

  @override
  String get errorLoadingGenres => '加载分类出错';

  @override
  String get noGenresFound => '未找到分类';

  @override
  String get noAlbumsInGenre => '该分类中没有专辑';

  @override
  String genreTooltip(int songCount, int albumCount) {
    return '$songCount 首歌曲 • $albumCount 张专辑';
  }

  @override
  String get sectionJukebox => '点唱机模式';

  @override
  String get jukeboxMode => '点唱机模式';

  @override
  String get jukeboxModeSubtitle => '通过服务器而非本设备播放音频';

  @override
  String get openJukeboxController => '打开点唱机控制器';

  @override
  String get jukeboxClearQueue => '清空队列';

  @override
  String get jukeboxShuffleQueue => '随机排序队列';

  @override
  String get jukeboxQueueEmpty => '队列中没有歌曲';

  @override
  String get jukeboxNowPlaying => '正在播放';

  @override
  String get jukeboxQueue => '播放队列';

  @override
  String get jukeboxVolume => '音量';

  @override
  String get playOnJukebox => '在点唱机上播放';

  @override
  String get addToJukeboxQueue => '添加到点唱机队列';

  @override
  String get jukeboxNotSupported => '此服务器不支持点唱机模式。请在服务器配置中启用（例如在 Navidrome 中设置 EnableJukebox = true）。';

  @override
  String get musicFoldersDialogTitle => '选择音乐文件夹';

  @override
  String get musicFoldersHint => '保持全部启用以使用所有文件夹（默认）。';

  @override
  String get musicFoldersSaved => '音乐文件夹选择已保存';

  @override
  String get artworkStyleSection => '封面样式';

  @override
  String get artworkCornerRadius => '圆角';

  @override
  String get artworkCornerRadiusSubtitle => '调整专辑封面的圆角程度';

  @override
  String get artworkCornerRadiusNone => '无';

  @override
  String get artworkShape => '形状';

  @override
  String get artworkShapeRounded => '圆角矩形';

  @override
  String get artworkShapeCircle => '圆形';

  @override
  String get artworkShapeSquare => '方形';

  @override
  String get artworkShadow => '阴影';

  @override
  String get artworkShadowNone => '无';

  @override
  String get artworkShadowSoft => '柔和';

  @override
  String get artworkShadowMedium => '中等';

  @override
  String get artworkShadowStrong => '强烈';

  @override
  String get artworkShadowColor => '阴影颜色';

  @override
  String get artworkShadowColorBlack => '黑色';

  @override
  String get artworkShadowColorAccent => '强调色';

  @override
  String get artworkPreview => '预览';

  @override
  String artworkCornerRadiusLabel(int value) {
    return '$value像素';
  }

  @override
  String get noArtwork => '无封面';

  @override
  String get serverUnreachableTitle => '无法连接服务器';

  @override
  String get serverUnreachableSubtitle => '服务器当前无法访问，是否进入离线模式？';

  @override
  String get openOfflineMode => '进入离线模式';

  @override
  String get appearanceSection => '外观';

  @override
  String get themeLabel => '主题模式';

  @override
  String get accentColorLabel => '强调色';

  @override
  String get circularDesignLabel => '圆角流线设计';

  @override
  String get circularDesignSubtitle => '界面元素使用现代圆角曲率';

  @override
  String get themeModeSystem => '跟随系统';

  @override
  String get themeModeLight => '浅色模式';

  @override
  String get themeModeDark => '深色模式';

  @override
  String get liveLabel => '直播';

  @override
  String get discordStatusText => 'Discord Rich Presence 状态';

  @override
  String get discordStatusTextSubtitle => '在 Discord 上展示当前正在聆听的音乐';

  @override
  String get discordRpcStyleArtist => '艺术家优先';

  @override
  String get discordRpcStyleSong => '歌曲名优先';

  @override
  String get discordRpcStyleApp => '仅显示应用名';

  @override
  String get sectionVolumeNormalization => '音量均衡与增益';

  @override
  String get sectionFadeInOut => '淡入淡出';

  @override
  String get fadeInOutEnable => '启用淡入淡出';

  @override
  String get fadeInOutSubtitle => '歌曲播放与暂停时平滑淡入淡出';

  @override
  String fadeDuration(int duration) {
    return '淡入淡出时长';
  }

  @override
  String get replayGainModeOff => '关闭';

  @override
  String get replayGainModeTrack => '音轨增益 (Track)';

  @override
  String get replayGainModeAlbum => '专辑增益 (Album)';

  @override
  String replayGainPreamp(String value) {
    return '预放大增益';
  }

  @override
  String get replayGainPreventClipping => '防止音频削顶失真';

  @override
  String replayGainFallbackGain(String value) {
    return '默认回退增益';
  }

  @override
  String autoDjSongsToAdd(int count) {
    return '自动 DJ 待添加歌曲数';
  }

  @override
  String get transcodingEnable => '启用服务端转码';

  @override
  String get transcodingEnableSubtitle => '在低带宽网络下将无损音频转码为有损格式';

  @override
  String get smartTranscoding => '智能自适应转码';

  @override
  String get smartTranscodingSubtitle => '根据当前网络类型（Wi-Fi 或移动数据）自动调整码率';

  @override
  String get smartTranscodingDetectedNetwork => '当前检测到的网络';

  @override
  String smartTranscodingActiveBitrate(String bitrate) {
    return '当前转码码率';
  }

  @override
  String get transcodingWifiQuality => 'Wi-Fi 音质';

  @override
  String get transcodingWifiQualitySubtitleSmart => '自适应或原始无损';

  @override
  String get transcodingWifiQualitySubtitle => 'Wi-Fi 连接下的音频品质';

  @override
  String get transcodingMobileQuality => '移动网络音质';

  @override
  String get transcodingMobileQualitySubtitleSmart => '在移动数据上自动使用';

  @override
  String get transcodingMobileQualitySubtitle => '移动网络下节省流量的品质配置';

  @override
  String get transcodingFormat => '转码音频格式';

  @override
  String get transcodingFormatSubtitle => '目标输出格式 (OPUS/MP3/AAC)';

  @override
  String get transcodingBitrateOriginal => '原始音质（不转码）';

  @override
  String get transcodingFormatOriginal => '原始格式';

  @override
  String get imageCacheTitle => '封面与图片缓存';

  @override
  String get imageCacheSubtitle => '管理已下载的专辑封面和艺术家插图缓存';

  @override
  String get musicCacheTitle => '音乐缓存';

  @override
  String get musicCacheSubtitle => '本地保存歌曲元数据';

  @override
  String get bpmCacheTitle => 'BPM 缓存';

  @override
  String get bpmCacheSubtitle => '本地保存 BPM 分析';

  @override
  String get sectionAboutInformation => '关于信息';

  @override
  String get sectionAboutDeveloper => '开发者';

  @override
  String get sectionAboutLinks => '相关链接';

  @override
  String get aboutVersion => '版本';

  @override
  String get aboutPlatform => '运行平台';

  @override
  String get aboutMadeBy => '开发者';

  @override
  String get aboutGitHub => 'GitHub 开源代码仓库';

  @override
  String get aboutLinkGitHub => 'GitHub';

  @override
  String get aboutLinkChangelog => '更新日志 (Changelog)';

  @override
  String get aboutLinkReportIssue => '反馈问题与建议';

  @override
  String get aboutLinkDiscord => '加入 Discord 社区';

  @override
  String get sectionAnalyticsPrivacy => '遥测与隐私';

  @override
  String get anonymousAnalytics => '匿名数据分析';

  @override
  String get anonymousAnalyticsSubtitle => '发送匿名使用统计以帮助改进 Musly';

  @override
  String get deviceId => '设备标识符';

  @override
  String deviceIdAnonymous(String id) {
    return '匿名 ID';
  }

  @override
  String get deviceIdDisabled => '已禁用';

  @override
  String get aboutDeviceId => '设备标识';

  @override
  String get aboutDeviceIdSubtitle => '此设备生成的匿名安装标识符';

  @override
  String get supportGreeting => '你好！';

  @override
  String get supportParagraph1 => '感谢你使用 Musly。这是一个倾注了大量心血打造的开源自托管音乐播放器。';

  @override
  String get supportParagraph2 => 'Musly 致力于为你提供极致、优雅且无打扰的听歌体验，连接你自己的音乐服务器。';

  @override
  String get supportParagraph3 => '如果你喜欢这款播放器，欢迎向身边的音乐爱好者推荐，或者提供代码与翻译贡献。';

  @override
  String get supportParagraph4 => '你的每一份支持都是让 Musly 变得更完美的动力！';

  @override
  String get supportDonationTitle => '赞助与支持';

  @override
  String get supportDonationSubtitle => '为项目开发者赞助一杯咖啡';

  @override
  String get supportDiscordTitle => 'Discord 交流群';

  @override
  String get supportDiscordSubtitle => '与开发者及其他用户交流交流';

  @override
  String get supportWaysTitle => '支持我们的方式';

  @override
  String get supportWayRate => '在应用商店给个五星好评';

  @override
  String get supportWayShare => '分享给身边的朋友';

  @override
  String get supportWayBugs => '向我们提交 Issue 或建议';

  @override
  String get supportWayEnjoy => '尽情享受你的美妙音乐之旅';

  @override
  String get supportMadeWithLove => '用心铸就，致敬音乐';

  @override
  String get playbackSpeed => '播放速度';

  @override
  String get normalSpeed => '正常速度';

  @override
  String get preservePitch => '保持音调';

  @override
  String get preservePitchSubtitle => '变速播放时保持音调不变（变调锁定）';

  @override
  String get pitch => '音调调节';

  @override
  String get pitchPreserved => '音调已锁定';

  @override
  String speedTooltipWithPitch(String speed, String pitch) {
    return '变速变调';
  }

  @override
  String speedTooltipPitchPreserved(String speed) {
    return '变速保调';
  }

  @override
  String get sleepTimer => '睡眠定时器';

  @override
  String get sleepTimerActive => '睡眠定时器运行中';

  @override
  String get fadeOut => '定时结束平滑淡出';

  @override
  String fadeOutSubtitle(int seconds) {
    return '倒计时结束前30秒平缓降低音量';
  }

  @override
  String get finishCurrentSong => '播完当前歌曲后停止';

  @override
  String get finishCurrentSongSubtitle => '定时结束后等待当前歌曲播放完毕再休眠';

  @override
  String sleepTimerMinutes(int count) {
    return '分钟';
  }

  @override
  String sleepTimerHours(int count) {
    return '小时';
  }

  @override
  String sleepTimerSetFor(String duration) {
    return '睡眠定时已设为';
  }

  @override
  String get customDuration => '自定义时长';

  @override
  String get cancelTimer => '取消定时器';

  @override
  String get customSleepTimer => '自定义睡眠定时';

  @override
  String get set => '设置';

  @override
  String get addToPlaylistTitle => '添加到歌单';

  @override
  String get yourPlaylistsLabel => '你的歌单';

  @override
  String get enableLrcLibFallback => '启用 LRCLIB 歌词备用源';

  @override
  String get lrcLibFallbackSubtitle => '当本地服务器没有歌词时自动从 LRCLIB 获取同步歌词';

  @override
  String get themeSaved => '主题已保存';

  @override
  String get themeUnsavedChanges => '未保存的主题更改';

  @override
  String get themeUnsavedChangesTitle => '保留更改？';

  @override
  String get themeUnsavedChangesBody => '您有尚未保存的主题设置，确定要放弃吗？';

  @override
  String get discard => '放弃';

  @override
  String get done => '完成';

  @override
  String pickColor(String label) {
    return '选取颜色';
  }

  @override
  String get titleStyle => '标题样式';

  @override
  String get artistStyle => '艺术家样式';

  @override
  String get themeActive => '已激活';

  @override
  String get themeSafeMode => '安全配色模式';

  @override
  String get themeCodeMode => '代码调试模式';

  @override
  String get themeAnimBadge => '动画';

  @override
  String themeAuthor(String author) {
    return '作者';
  }

  @override
  String get audioFocusDenied => '音频焦点获取失败';

  @override
  String get addToLibrary => '添加到媒体库';

  @override
  String get alreadyInLibrary => '已存在于媒体库中';

  @override
  String get selectPlaylist => '选择歌单';

  @override
  String get endOfSong => '歌曲结束时';

  @override
  String get muslyConnect => 'Musly 互联 (Connect)';

  @override
  String get connectToDevice => '连接到设备';

  @override
  String get currentlyPlayingOn => '正在播放于';

  @override
  String get noDevicesFound => '未发现附近设备';

  @override
  String get transferPlaybackHere => '将播放转移至本机';

  @override
  String playbackTransferredTo(String device) {
    return '播放已转移至';
  }

  @override
  String get muslyBeatSync => 'Musly 节拍同步';

  @override
  String get beatSyncSubtitle => '局域网内多设备同步同步播放派对';

  @override
  String get hostParty => '发起派对 (Host)';

  @override
  String get joinParty => '加入派对 (Join)';

  @override
  String get leaveParty => '离开派对';

  @override
  String get audioPhaseCalibration => '音频相位校准';

  @override
  String get phaseCalibrationSubtitle => '微调局域网扬声器同步延迟';

  @override
  String get partySpeakers => '派对扬声器';

  @override
  String get muslyWrapped => 'Musly 年度音乐回忆 (Wrapped)';

  @override
  String get wrappedSeasonal => '年度总结季已开启！';

  @override
  String get playYourTopSongs => '播放你的年度精选榜单';

  @override
  String get milestone50SongsTitle => '里程碑成就';

  @override
  String get milestone50SongsBadge => '听歌达人';

  @override
  String get milestone50SongsMessage => '恭喜！您已经累计聆听了超过50首不同歌曲！';

  @override
  String get continueListening => '继续聆听';

  @override
  String get lyricsUnderArtwork => '在封面下方显示歌词';

  @override
  String get lyricsUnderArtworkSubtitle => '在全屏播放器中封面下方直接嵌入滚动歌词';

  @override
  String get lyricsDisplaySection => '歌词显示效果';

  @override
  String get lyricsBlurUnfocused => '非聚焦行模糊景深';

  @override
  String get lyricsBlurUnfocusedSubtitle => '模糊非当前播放的歌词行，聚焦高亮当前歌词';

  @override
  String get lyricsAlignment => '歌词对齐方式';

  @override
  String get lyricsAlignmentCentered => '居中对齐';

  @override
  String get lyricsAlignmentLeft => '靠左对齐';

  @override
  String get alignLeft => '靠左';

  @override
  String get alignCenter => '居中';

  @override
  String get lyricsGlowEffect => '发光流光效果';

  @override
  String get lyricsGlowEffectSubtitle => '为当前播放的高亮歌词添加微光动画';

  @override
  String get hideWindowTitlebar => '隐藏窗口标题栏';

  @override
  String get hideWindowTitlebarSubtitle => '无边框沉浸式窗口（桌面端生效）';

  @override
  String get sectionSmartCrossfade => '智能淡入淡出交叉过渡 (Crossfade)';

  @override
  String get trackCrossfade => '歌曲交叉过渡 (Crossfade)';

  @override
  String get crossfadeOffSubtitle => '已关闭交叉过渡';

  @override
  String crossfadeDurationSubtitle(int seconds) {
    return '首尾平滑过渡重叠时间';
  }

  @override
  String crossfadeDurationBadge(int seconds) {
    return '秒';
  }

  @override
  String get sectionGaplessPlayback => '无缝连续播放 (Gapless)';

  @override
  String get gaplessPlayback => '无缝播放';

  @override
  String get gaplessPlaybackSubtitle => '消除音轨间的静音间隙，还原现场及概念专辑听感';

  @override
  String get sectionLyrics => '歌词设置';

  @override
  String get networkWifi => 'Wi-Fi 无线网络';

  @override
  String get networkMobile => '移动蜂窝网络';

  @override
  String get downloadFolder => '下载存储目录';

  @override
  String get downloadFolderDefault => '默认应用存储目录';

  @override
  String get activeDownloads => '进行中的下载';

  @override
  String get noDownloadsInProgress => '当前没有下载任务';

  @override
  String get playlistDownloads => '歌单离线下载';

  @override
  String playlistSongsDownloadedCount(int count) {
    return '已下载歌曲';
  }

  @override
  String get songsStreamCache => '流媒体音频缓存';

  @override
  String get imageArtworkCache => '封面图片缓存';

  @override
  String cacheDiskUsage(String size) {
    return '缓存占用';
  }

  @override
  String totalCacheDiskUsage(String size) {
    return '缓存总占用空间';
  }

  @override
  String get clearAudioCacheTooltip => '清理音频流媒体缓存';

  @override
  String get clearImageCacheTooltip => '清理封面图像缓存';

  @override
  String get audioCacheCleared => '音频缓存已成功清理';

  @override
  String get imageCacheCleared => '封面缓存已成功清理';

  @override
  String folderAdded(String path) {
    return '文件夹已成功添加';
  }

  @override
  String get removeFolderTitle => '移除文件夹';

  @override
  String removeFolderConfirm(String path) {
    return '确定要从本地音乐库中移除此文件夹吗？';
  }

  @override
  String get folderRemoved => '文件夹已移除';

  @override
  String get loadingLibrary => '正在加载媒体库…';

  @override
  String get libraryEmptyError => '无法加载媒体库内容';

  @override
  String get serverStatusConnected => '已连接';

  @override
  String get serverStatusConnecting => '正在连接…';

  @override
  String get serverStatusOffline => '离线';

  @override
  String get serverStatusNotConnected => '未连接';

  @override
  String get switchServerButton => '切换服务器';

  @override
  String get savedServersSection => '已保存的服务器列表';

  @override
  String get manage => '管理';

  @override
  String get serverActiveBadge => '当前活跃';

  @override
  String get addServerOrService => '添加新服务器或音乐源';

  @override
  String get welcomeTourTitle => '新手功能导览';

  @override
  String get welcomeTourSubtitle => '探索 Musly 的核心特性与手势操作';

  @override
  String get muslyPlaybackDev => 'Musly 开发者回顾预览';

  @override
  String get muslyPlaybackDevSubtitle => '提前体验年度音乐报告预览版';

  @override
  String get muslyPlaybackAnnual => 'Musly 年度音乐回忆';

  @override
  String get muslyPlaybackAnnualSubtitle => '回顾你一整年的音乐时光';

  @override
  String get sectionAboutSupport => '支持与评价';

  @override
  String get thanksForRating => '感谢你的评分支持！';

  @override
  String get rateMusly => '为 Musly 评分';

  @override
  String get alreadyRatedSubtitle => '你已提交过评价';

  @override
  String get shareFeedbackSubtitle => '告诉我们你的使用感受和改进建议';

  @override
  String get supportMuslyTitle => '赞助 Musly';

  @override
  String get supportMuslySubtitle => '支持开源项目的长期维护与更新';

  @override
  String get rateMuslyDialogTitle => '评价 Musly';

  @override
  String get rateMuslyDialogQuestion => '你喜欢使用 Musly 听歌吗？';

  @override
  String get optionalFeedbackHint => '写下你的宝贵反馈（可选）…';

  @override
  String get submit => '提交';

  @override
  String get thankYouFeedback => '非常感谢你的宝贵反馈！';

  @override
  String devPlaybackTapsAway(int count) {
    return '再点击次即可解锁开发者预览';
  }

  @override
  String get devPlaybackUnlocked => '已解锁年度回忆预览模式！';

  @override
  String get craftedWith => '精心打造';

  @override
  String get inItaly => '源自意大利';

  @override
  String get switchServerTitle => '切换服务器';

  @override
  String get switchServerSubtitle => '选择要连接的自建音乐服务器';

  @override
  String get addServerButton => '添加新服务器';

  @override
  String get noServersSavedYet => '尚未添加任何服务器';

  @override
  String connectedTo(String name) {
    return '已连接至';
  }

  @override
  String errorConnectingServer(String error) {
    return '连接服务器时发生错误';
  }

  @override
  String get renameServerProfile => '重命名服务器配置';

  @override
  String get profileNameLabel => '配置名称';

  @override
  String get enterNewNameHint => '输入新的名称';

  @override
  String get removeServerTitle => '删除服务器配置';

  @override
  String removeServerConfirm(String name) {
    return '确定要删除此服务器配置吗？离线缓存不会受影响。';
  }

  @override
  String get noPlaylistsFound => '未找到相关歌单';

  @override
  String get supportDialogDescription => 'Musly 是一个完全免费且开源的自建音乐播放器。您的喜爱与支持是我们持续迭代的最大动力！';

  @override
  String get supportDialogJoinDiscord => '加入 Discord 社区';

  @override
  String get supportDialogDiscordSubtitle => '交流听歌心得与获取最新测试版本';

  @override
  String get supportDialogDonateTitle => '赞助支持开发';

  @override
  String get supportDialogDonateSubtitle => '在 GitHub Sponsors 或 Buy Me A Coffee 上赞助';

  @override
  String get dontShowAgain => '不再提示';

  @override
  String get maybeLater => '稍后再说';

  @override
  String get addAllToQueue => '全部加入播放队列';

  @override
  String songsAddedToQueue(int count) {
    return '首歌曲已加入队列';
  }

  @override
  String get searchInAlbum => '在专辑内搜索';

  @override
  String get searchInPlaylist => '在歌单内搜索';

  @override
  String get filterTracks => '筛选音轨';

  @override
  String get filterSongs => '过滤歌曲';

  @override
  String get noSongsInQueue => '播放队列中暂无歌曲';

  @override
  String get moreOptions => '更多选项';

  @override
  String get upNext => '即将播放';

  @override
  String get removeSelected => '移除所选项';

  @override
  String get reorderSongs => '调整歌曲顺序';

  @override
  String get selectSongs => '多选歌曲';

  @override
  String get doneReordering => '完成排序';

  @override
  String get downloadAlbum => '下载整张专辑';

  @override
  String get downloadPlaylist => '下载整个歌单';

  @override
  String get downloadedTapToRemove => '已下载（点击删除）';

  @override
  String get downloadingTapToCancel => '正在下载（点击取消）';

  @override
  String get removeDownloadsTitle => '删除已下载文件';

  @override
  String removeAlbumDownloadsConfirm(int count, String name) {
    return '确定要删除此专辑的离线下载音频吗？';
  }

  @override
  String removePlaylistDownloadsConfirm(int count, String name) {
    return '确定要删除此歌单的离线下载音频吗？';
  }

  @override
  String queuedSongsForDownload(int count) {
    return '首歌曲已加入下载队列';
  }

  @override
  String get songRemovedFromPlaylist => '已从歌单中移除歌曲';

  @override
  String errorRemovingSong(String error) {
    return '移除歌曲失败';
  }

  @override
  String errorReorderingSong(String error) {
    return '调整顺序失败';
  }

  @override
  String get removeSongsTitle => '批量移除歌曲';

  @override
  String removePlaylistSongsConfirm(int count, String name) {
    return '确定要从歌单中移除选中的歌曲吗？';
  }

  @override
  String removedSongsFromPlaylist(int count) {
    return '首歌曲已从歌单中移除';
  }

  @override
  String get alreadyInPlaylist => '歌曲已在歌单中';

  @override
  String alreadyInPlaylistConfirm(String title, String playlist) {
    return '部分歌曲已在此歌单中，是否仍然添加重复项？';
  }

  @override
  String get addAnyway => '仍然添加';

  @override
  String get offlineModeQuestion => '当前处于离线状态，是否浏览已下载的离线音乐？';

  @override
  String get drumroll => '准备好了吗…';

  @override
  String get readyToDiscoverTopSong => '揭晓你今年的最爱单曲！';

  @override
  String get tapToBegin => '点击屏幕启程';

  @override
  String get minutesListened => '累计聆听分钟';

  @override
  String get totalHours => '总时长 (小时)';

  @override
  String get uniqueTracks => '不同歌曲数';

  @override
  String get topSongsHeader => '最爱单曲 TOP 榜';

  @override
  String get yourMostListenedSongs => '过去一年里陪伴你最多的旋律';

  @override
  String get topArtistsHeader => '年度最爱音乐人';

  @override
  String playsCount(int count) {
    return '播放次数';
  }

  @override
  String get topSongBadge => '年度金曲';

  @override
  String get topArtistMetric => '最爱歌手';

  @override
  String get genreMetric => '风格探索';

  @override
  String get muslyPlaybackHeader => '你的专属音乐报告';

  @override
  String get enableMuslyConnect => '启用 Musly 互联';

  @override
  String get enableMuslyConnectSubtitle => '允许在同一局域网设备间无缝流转播放';

  @override
  String get availableDevices => '可用设备列表';

  @override
  String get lanDiscoveryActive => '局域网设备发现已开启';

  @override
  String nearbyDevicesFound(int count) {
    return '个附近设备';
  }

  @override
  String get minutes => '分钟';

  @override
  String get nowPlayingHeader => '正在播放';

  @override
  String get privacyFirstTitle => '隐私至上';

  @override
  String get privacyFirstSubtitle => '你的音乐数据完全属于你自己';

  @override
  String get noDataSellingTitle => '绝不出售数据';

  @override
  String get noDataSellingDescription => '我们绝不会收集、出售或共享您的个人隐私或听歌习惯。';

  @override
  String get localFirstStorageTitle => '本地优先存储';

  @override
  String get localFirstStorageDescription => '所有凭证和偏好设置均安全加密保存在本地设备上。';

  @override
  String get privateOpenTitle => '透明开源';

  @override
  String get privateOpenDescription => '代码百分之百开源，任何人都可以审计和监督。';

  @override
  String get readFullPrivacyPolicy => '阅读完整隐私条款';

  @override
  String get viewCompleteDetailsWebsite => '在官方网站查看隐私政策详情';

  @override
  String get understandAndContinue => '已阅读并同意';

  @override
  String get declineAndExit => '拒绝并退出';

  @override
  String get exitApp => '退出应用';

  @override
  String get stop => '停止';

  @override
  String get closeQueue => '收起播放队列';

  @override
  String get timerOff => '定时已关闭';

  @override
  String get history => '播放历史';

  @override
  String get searchInLibrary => '在音乐库中搜索';

  @override
  String get add => '添加';

  @override
  String get clear => '清除';

  @override
  String get back => '返回';

  @override
  String get previousSlide => '上一页';

  @override
  String get nextSlide => '下一页';

  @override
  String get radios => '广播电台';

  @override
  String get downloads => '离线下载';

  @override
  String get noDownloadedSongsYet => '暂无已下载歌曲';

  @override
  String get noDownloadedAlbumsYet => '暂无已下载专辑';

  @override
  String get connectedToWebStream => '已连接至网络音频流';

  @override
  String get allowSelfSignedCertificatesSubtitle => '允许连接自签名 SSL 证书的自托管服务器';

  @override
  String get legacyAuthenticationSubtitle => '对不支持 token 认证的旧版 Subsonic 服务器使用明文凭证';

  @override
  String get certificateFileSubtitle => '自定义 CA 证书文件 (.crt / .pem)';

  @override
  String get clientIdentityFileSubtitle => '双向 TLS 客户端身份证书 (.p12 / .pfx)';

  @override
  String get copyError => '复制错误信息';

  @override
  String get errorCopiedToClipboard => '错误日志已复制到剪贴板';

  @override
  String get failedToUpdateFavorite => '更新喜欢状态失败';

  @override
  String queuedSongsFromAlbumsForDownload(int songCount, int albumCount) {
    return '首歌曲已加入下载队列';
  }

  @override
  String get downloadAllAlbums => '下载所有专辑';

  @override
  String get downloadAllFavorites => '下载所有最爱歌曲';

  @override
  String get downloadAll => '全部下载';

  @override
  String get createPlaylistSubtitle => '新建空白歌单并添加歌曲';

  @override
  String get addMusicSource => '添加音乐源';

  @override
  String get addMusicSourceSubtitle => '添加新的 Subsonic/Jellyfin 服务器或本地目录';

  @override
  String get removeFromFavoritesTitle => '取消喜欢';

  @override
  String removeFromFavoritesConfirm(String title) {
    return '确定要将此歌曲从最爱列表中移除吗？';
  }

  @override
  String failedToRemove(String error) {
    return '移除失败';
  }

  @override
  String streamUrlLabel(String url) {
    return '流媒体 URL';
  }

  @override
  String get shuffleNewSelection => '重新随机挑选';

  @override
  String get sortDurationLongest => '按时长由长到短';

  @override
  String get connectToServer => '连接至服务器';

  @override
  String get renameProfile => '重命名配置';

  @override
  String get addWebStream => '添加网络音频流';

  @override
  String get addWebStreamSubtitle => '收听在线电台或网络直播流';

  @override
  String get recentSearches => '最近搜索';

  @override
  String get createPlaylistToGetStarted => '创建第一个歌单开始吧';

  @override
  String get addRadioStationsHint => '输入在线电台流地址 (.m3u8, .aac, .mp3)';

  @override
  String get onboardingNext => '下一步';

  @override
  String get onboardingGetStarted => '立即体验';

  @override
  String get previousSlideTooltip => '上一页';

  @override
  String get nextSlideTooltip => '下一页';

  @override
  String get onboardingSlide1TitlePrefix => '连接你的';

  @override
  String get onboardingSlide1TitleHighlight => '个人音乐库';

  @override
  String get onboardingSlide1Description => '原生支持 Subsonic、Navidrome、Jellyfin 以及本地离线存储，随时随地享受高解析音乐。';

  @override
  String get onboardingSlide1Feature1Title => '自建服务器集成';

  @override
  String get onboardingSlide1Feature1Desc => '深度兼容所有 Subsonic API 标准服务';

  @override
  String get onboardingSlide1Feature2Title => '无损格式支持';

  @override
  String get onboardingSlide1Feature2Desc => '完美回放 FLAC, ALAC, WAV, DSD 等高保真音质';

  @override
  String get onboardingSlide1Feature3Title => '本地音乐整合';

  @override
  String get onboardingSlide1Feature3Desc => '无需服务器，也可直接浏览设备本地音频';

  @override
  String get onboardingSlide2TitlePrefix => '沉浸式';

  @override
  String get onboardingSlide2TitleHighlight => '灵动播放体验';

  @override
  String get onboardingSlide2Description => '精心调校的动态流体磨砂背景，流畅同步歌词与手势滑动控制。';

  @override
  String get onboardingSlide2Feature1Title => '逐字与逐行动画歌词';

  @override
  String get onboardingSlide2Feature1Desc => '毫秒级同步，支持 LRCLIB 自动检索';

  @override
  String get onboardingSlide2Feature2Title => '动态模糊与强调色';

  @override
  String get onboardingSlide2Feature2Desc => '界面随专辑色彩灵动幻化';

  @override
  String get onboardingSlide2Feature3Title => '手势顺滑控制';

  @override
  String get onboardingSlide2Feature3Desc => '底盘悬浮迷你播放器，轻轻一滑随心操控';

  @override
  String get onboardingSlide3TitlePrefix => '离线播放与';

  @override
  String get onboardingSlide3TitleHighlight => '多端互联';

  @override
  String get onboardingSlide3Description => '无缝跨设备流转、DLNA 投屏与离线下载，无网也能尽情聆听。';

  @override
  String get onboardingSlide3Feature1Title => '高速离线缓存';

  @override
  String get onboardingSlide3Feature1Desc => '一键离线歌单与整张专辑';

  @override
  String get onboardingSlide3Feature2Title => '跨设备互联';

  @override
  String get onboardingSlide3Feature2Desc => '将播放无缝推送到电视或音箱';

  @override
  String get onboardingSlide3Feature3Title => 'Android Auto 车载';

  @override
  String get onboardingSlide3Feature3Desc => '安全驾驶同时享受沉浸音乐';

  @override
  String get finishTour => '开启探索';

  @override
  String get skip => '跳过';

  @override
  String get profileNameOptional => '配置名称（可选）';

  @override
  String get serverUrlRequired => '服务器地址（必填）';

  @override
  String get lanServerUrlOptional => '局域网内网地址（可选）';

  @override
  String get usernameRequired => '用户名（必填）';

  @override
  String get passwordRequired => '密码（必填）';

  @override
  String get playingInSync => '正在同步播放';

  @override
  String get switchedBackToThisDevice => '已切换回本机播放';

  @override
  String connectedToDeviceName(String device) {
    return '已连接至';
  }

  @override
  String get whatDoYouWantToPlay => '今天想听点什么？';

  @override
  String get noLyricsFound => '暂无歌词';

  @override
  String get dynamicColor => 'Material You 动态取色';

  @override
  String get muslyPlayback => '年度听歌回顾';

  @override
  String get synthesizingUniverse => '正在生成你的音乐宇宙…';

  @override
  String get getReadyForBeatDrop => '准备迎接高潮节拍';

  @override
  String yourYearInSound(int year) {
    return '你的年度声音印记';
  }

  @override
  String get yourYearInSoundSubtitle => '音符交织出的珍贵回忆';

  @override
  String get yourMusicalChronotype => '你的听歌生物钟';

  @override
  String get genreGalaxy => '曲风星系';

  @override
  String get soundsThatGuidedYou => '指引你的旋律';

  @override
  String get yourMusicalAnchors => '你的音乐锚点';

  @override
  String get yourListeningPersonality => '你的听歌性格原型';

  @override
  String get yourYearInReviewIsReady => '你的年度音乐总结已就绪';

  @override
  String get chronotypeMidnightWanderer => '午夜漫游者';

  @override
  String get chronotypeMidnightWandererDesc => '你习惯在夜深人静时沉浸于音乐中，旋律是你的避风港。';

  @override
  String get chronotypeSunriseHarmonizer => '晨曦和声家';

  @override
  String get chronotypeSunriseHarmonizerDesc => '朝阳初升时，你用清爽跃动的旋律唤醒崭新的一天。';

  @override
  String get chronotypeAfternoonFlow => '午后心流者';

  @override
  String get chronotypeAfternoonFlowDesc => '在下午时光里，音符伴随你的灵感与专注悄然流淌。';

  @override
  String get chronotypeTwilightLounger => '暮色栖居者';

  @override
  String get chronotypeTwilightLoungerDesc => '黄昏降临时，你喜欢用温柔惬意的曲调卸下一天的疲惫。';

  @override
  String get archetypeLuminary => '引光领航者';

  @override
  String get archetypeLuminaryBadge => '探索先锋';

  @override
  String get archetypeLuminaryDesc => '走在曲风最前沿，不断探索未知的独立小众音乐。';

  @override
  String get archetypeLuminaryTrait1 => '敏锐嗅觉';

  @override
  String get archetypeLuminaryTrait2 => '不拘一格';

  @override
  String get archetypeLuminaryTrait3 => '先锋品味';

  @override
  String get archetypeDevotee => '深情挚爱者';

  @override
  String get archetypeDevoteeBadge => '忠实乐迷';

  @override
  String get archetypeDevoteeDesc => '对喜爱的艺术家深情不渝，一张专辑可以反复循环数十次。';

  @override
  String get archetypeDevoteeTrait1 => '极度专注';

  @override
  String get archetypeDevoteeTrait2 => '长情陪伴';

  @override
  String get archetypeDevoteeTrait3 => '共鸣至深';

  @override
  String get archetypeNightOwl => '夜行猫头鹰';

  @override
  String get archetypeNightOwlBadge => '夜之诗人';

  @override
  String get archetypeNightOwlDesc => '月光下的孤独灵魂，低音和合成器是你在黑暗中最温暖的慰藉。';

  @override
  String get archetypeNightOwlTrait1 => '感性敏感';

  @override
  String get archetypeNightOwlTrait2 => '内省深邃';

  @override
  String get archetypeNightOwlTrait3 => '深夜回响';

  @override
  String get archetypeSunrise => '初阳捕手';

  @override
  String get archetypeSunriseBadge => '能量源泉';

  @override
  String get archetypeSunriseDesc => '用充满律动与活力的旋律点燃清晨，永远保持积极向上。';

  @override
  String get archetypeSunriseTrait1 => '朝气蓬勃';

  @override
  String get archetypeSunriseTrait2 => '元气律动';

  @override
  String get archetypeSunriseTrait3 => '明朗治愈';

  @override
  String get archetypeAlchemist => '声律炼金术士';

  @override
  String get archetypeAlchemistBadge => '全能学者';

  @override
  String get archetypeAlchemistDesc => '古典、爵士、摇滚、电子无所不听，在多元的乐风中融会贯通。';

  @override
  String get archetypeAlchemistTrait1 => '包罗万象';

  @override
  String get archetypeAlchemistTrait2 => '博学多闻';

  @override
  String get archetypeAlchemistTrait3 => '结构鉴赏';

  @override
  String get percentileTop05 => '前 0.5% 顶尖乐迷';

  @override
  String get percentileTop1 => '前 1% 忠实粉丝';

  @override
  String get percentileTop5 => '前 5% 超级听众';

  @override
  String get percentileTop10 => '前 10% 狂热乐迷';

  @override
  String get percentileTopAficionado => '资深音乐鉴赏家';

  @override
  String get superfanBadge01 => '超级铁粉 TOP 0.1%';

  @override
  String get superfanBadge1 => '铁杆粉丝 TOP 1%';

  @override
  String get superfanBadge5 => '忠实粉丝 TOP 5%';

  @override
  String get tabAndroidAuto => '车载 (Android Auto)';

  @override
  String get androidAutoNotSupported => '当前设备暂不支持 Android Auto';

  @override
  String get androidAutoCategories => '展示分类';

  @override
  String get androidAutoPerformance => '性能与响应';

  @override
  String get androidAutoShowRecent => '显示最近播放';

  @override
  String get androidAutoShowFavorites => '显示收藏喜欢';

  @override
  String get androidAutoShowAlbums => '显示专辑分类';

  @override
  String get androidAutoShowArtists => '显示艺术家分类';

  @override
  String get androidAutoShowPlaylists => '显示歌单分类';

  @override
  String get androidAutoShowGenres => '显示曲风分类';

  @override
  String get androidAutoShowRadio => '显示在线电台';

  @override
  String get androidAutoShowDownloads => '显示离线下载';

  @override
  String get androidAutoMaxItems => '每类最大显示项目数';

  @override
  String get androidAutoMaxItemsDesc => '限制车载屏幕展示数量以确保安全与流畅';

  @override
  String get androidAutoNowPlaying => '车载正在播放';

  @override
  String get androidAutoRecent => '车载最近播放';

  @override
  String get androidAutoFavorites => '车载收藏';

  @override
  String get androidAutoAlbums => '车载专辑';

  @override
  String get androidAutoArtists => '车载艺术家';

  @override
  String get androidAutoPlaylists => '车载歌单';

  @override
  String get androidAutoGenres => '车载曲风';

  @override
  String get androidAutoRadio => '车载电台';

  @override
  String get androidAutoDownloads => '车载离线';

  @override
  String get androidAutoShuffle => '车载随机播放';

  @override
  String get androidAutoQueue => '车载当前队列';

  @override
  String get androidAutoEmptyFavorites => '车载收藏为空';

  @override
  String get androidAutoEmptyRadio => '车载暂无电台';

  @override
  String get androidAutoEmptyDownloads => '车载无离线下载';

  @override
  String get androidAutoLoading => '车载媒体库加载中…';

  @override
  String get androidAutoOnlineStream => '车载在线流媒体';

  @override
  String get androidAutoServerSection => '车载连接服务器';

  @override
  String get androidAutoDefaultServer => '默认车载服务器';

  @override
  String get androidAutoDefaultServerDesc => '汽车启动时自动连接此服务器';

  @override
  String get androidAutoUseActiveServer => '使用手机端当前活跃服务器';
}
