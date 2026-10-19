import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:musly/l10n/app_localizations.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/services/analytics_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musly/widgets/settings/settings_section_card.dart';
import 'package:musly/widgets/settings/settings_list_tile.dart';
import 'package:musly/utils/context_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:musly/screens/onboarding/onboarding_screen.dart';
import 'package:musly/screens/wrapped/wrapped_screen.dart';
import 'package:musly/services/wrapped_service.dart';
import 'package:musly/services/update_service.dart';

class SettingsAboutTab extends StatefulWidget {
  const SettingsAboutTab({super.key});

  @override
  State<SettingsAboutTab> createState() => _SettingsAboutTabState();
}

class _SettingsAboutTabState extends State<SettingsAboutTab> {
  bool _hasRated = false;
  int _versionTapCount = 0;
  bool _devWrappedUnlocked = false;

  bool get _isDesktop =>
      !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _hasRated = prefs.getBool('has_rated_app') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 48),
      children: [
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAboutInformation,
          children: [
            _buildInfoTile(
              context,
              icon: CupertinoIcons.info,
              iconColor: Theme.of(context).colorScheme.primary,
              title: AppLocalizations.of(context)!.aboutVersion,
              subtitle: '${UpdateService.currentVersion} (Veyino Edition)',
              onTap: _onVersionTapped,
            ),
            _buildDivider(context),
            _buildInfoTile(
              context,
              icon: CupertinoIcons.sparkles,
              iconColor: const Color(0xFF10B981),
              title: '维护与定制',
              subtitle: 'Veyino 团队',
            ),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: 'Veyino 团队',
          children: [
            _buildLinkTile(
              context,
              icon: CupertinoIcons.globe,
              title: '团队官网',
              subtitle: 'veyino.org',
              url: 'https://veyino.org',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: Icons.code_rounded,
              title: 'GitHub (创作者)',
              subtitle: 'github.com/ysnsk111',
              url: 'https://github.com/ysnsk111',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: CupertinoIcons.mail_solid,
              title: '团队邮箱',
              subtitle: 'veyinotm@gmail.com',
              url: 'mailto:veyinotm@gmail.com',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: CupertinoIcons.headphones,
              title: '联系支持',
              subtitle: 'support@veyino.org',
              url: 'mailto:support@veyino.org',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: Icons.fork_right_rounded,
              title: '原项目 Fork 来源 (Musly)',
              subtitle: 'github.com/dddevid/Musly',
              url: 'https://github.com/dddevid/Musly',
            ),
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAboutDeveloper,
          children: [_buildDeveloperInfo(context)],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: AppLocalizations.of(context)!.sectionAboutLinks,
          children: [
            _buildLinkTile(
              context,
              icon: Icons.code_rounded,
              title: 'Veyino GitHub 仓库',
              subtitle: 'github.com/ysnsk111/Musly-vt-fork',
              url: 'https://github.com/ysnsk111/Musly-vt-fork',
            ),
            _buildDivider(context),
            _buildLinkTile(
              context,
              icon: CupertinoIcons.exclamationmark_bubble,
              title: '提交问题与支持',
              subtitle: 'support@veyino.org',
              url: 'mailto:support@veyino.org',
            ),
            _buildDivider(context),
            _buildActionTile(
              context,
              icon: CupertinoIcons.sparkles,
              title: AppLocalizations.of(context)!.welcomeTourTitle,
              subtitle: AppLocalizations.of(context)!.welcomeTourSubtitle,
              iconColor: const Color(0xFF6366F1),
              onTap: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const OnboardingScreen(),
                  ),
                );
              },
            ),
            if (!_isDesktop &&
                (WrappedService.isWrappedSeason() ||
                    (kDebugMode && _devWrappedUnlocked))) ...[
              _buildDivider(context),
              _buildActionTile(
                context,
                icon: CupertinoIcons.gift_fill,
                iconColor: const Color(0xFFFA243C),
                title: kDebugMode && !WrappedService.isWrappedSeason()
                    ? AppLocalizations.of(context)!.muslyPlaybackDev
                    : AppLocalizations.of(context)!.muslyPlaybackAnnual,
                subtitle: kDebugMode && !WrappedService.isWrappedSeason()
                    ? AppLocalizations.of(context)!.muslyPlaybackDevSubtitle
                    : AppLocalizations.of(context)!.muslyPlaybackAnnualSubtitle,
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => WrappedScreen(
                        devPreview: kDebugMode && _devWrappedUnlocked,
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
        const SizedBox(height: 24),
        SettingsSectionCard(
          title: '更新与反馈',
          children: [
            _buildActionTile(
              context,
              icon: CupertinoIcons.arrow_clockwise_circle_fill,
              iconColor: const Color(0xFF3B82F6),
              title: '检查更新',
              subtitle: '检查 Veyino 版本更新',
              onTap: () => _manualCheckForUpdate(context),
            ),
            _buildDivider(context),
            _buildActionTile(
              context,
              icon: CupertinoIcons.star_fill,
              iconColor: const Color(0xFFFFCC00),
              title: _hasRated
                  ? AppLocalizations.of(context)!.thanksForRating
                  : AppLocalizations.of(context)!.rateMusly,
              subtitle: _hasRated
                  ? AppLocalizations.of(context)!.alreadyRatedSubtitle
                  : AppLocalizations.of(context)!.shareFeedbackSubtitle,
              onTap: _hasRated ? null : () => _showRatingDialog(context),
            ),
          ],
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56),
      child: Container(
        height: 0.5,
        color: context.isDark ? AppTheme.darkDivider : AppTheme.lightDivider,
      ),
    );
  }

  Widget _buildInfoTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return SettingsListTile(
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor, size: 18),
      ),
      title: title,
      trailing: Text(
        subtitle,
        style: TextStyle(
          fontSize: 16,
          color: context.isDark
              ? AppTheme.darkSecondaryText
              : AppTheme.lightSecondaryText,
        ),
      ),
      onTap: onTap,
    );
  }

  void _onVersionTapped() {
    if (!kDebugMode || _isDesktop) return;

    setState(() {
      _versionTapCount++;
      if (_versionTapCount >= 8) {
        _devWrappedUnlocked = true;
      }
    });

    HapticFeedback.lightImpact();

    if (_versionTapCount < 8 && _versionTapCount >= 4) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.devPlaybackTapsAway(8 - _versionTapCount)),
          duration: const Duration(milliseconds: 700),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else if (_versionTapCount == 8) {
      final l10n = AppLocalizations.of(context)!;
      HapticFeedback.heavyImpact();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(CupertinoIcons.sparkles,
                  color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(l10n.devPlaybackUnlocked),
            ],
          ),
          backgroundColor: const Color(0xFFFA243C),
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Widget _buildDeveloperInfo(BuildContext context) {
    return Column(
      children: [
        SettingsListTile(
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF5856D6), Color(0xFFAF52DE)],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.code_rounded, color: Colors.white, size: 18),
          ),
          title: '开发者 / 创作者',
          subtitle: 'Veyino 团队 (GitHub: ysnsk111)',
          trailing: const Icon(Icons.open_in_new_rounded, size: 18),
          onTap: () => _openUrl('https://github.com/ysnsk111'),
        ),
        _buildDivider(context),
        SettingsListTile(
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.fork_right_rounded,
                color: Color(0xFF6366F1), size: 18),
          ),
          title: '原项目 Fork 来源 (Musly)',
          subtitle: 'github.com/dddevid/Musly',
          trailing: const Icon(Icons.open_in_new_rounded, size: 18),
          onTap: () => _openUrl('https://github.com/dddevid/Musly'),
        ),
      ],
    );
  }

  Widget _buildLinkTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required String url,
  }) {
    return SettingsListTile(
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 18,
        ),
      ),
      title: title,
      subtitle: subtitle,
      trailing: Icon(
        Icons.open_in_new_rounded,
        size: 18,
        color: context.isDark
            ? AppTheme.darkSecondaryText
            : AppTheme.lightSecondaryText,
      ),
      onTap: () => _openUrl(url),
    );
  }

  void _openUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error opening URL: $e');
    }
  }

  Future<void> _manualCheckForUpdate(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('正在检查更新...'),
        duration: Duration(seconds: 1),
      ),
    );
    final release = await UpdateService.checkForUpdate();
    if (!context.mounted) return;
    if (release == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('已是最新版本！'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('发现新版本: v${release.version}'),
          content: Text(UpdateService.stripMarkdown(release.body)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('稍后'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                _openUrl(release.htmlUrl);
              },
              child: const Text('前往更新'),
            ),
          ],
        ),
      );
    }
  }

  void _showRatingDialog(BuildContext context) async {
    final ratingController = TextEditingController();
    int selectedRating = 5;
    final l10n = AppLocalizations.of(context)!;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(l10n.rateMuslyDialogTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.rateMuslyDialogQuestion),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    final starIndex = index + 1;
                    return IconButton(
                      icon: Icon(
                        starIndex <= selectedRating
                            ? CupertinoIcons.star_fill
                            : CupertinoIcons.star,
                        color: const Color(0xFFFFCC00),
                      ),
                      onPressed: () {
                        setDialogState(() => selectedRating = starIndex);
                      },
                    );
                  }),
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: TextField(
                    controller: ratingController,
                    decoration: InputDecoration(
                      hintText: l10n.optionalFeedbackHint,
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(l10n.submit),
            ),
          ],
        ),
      ),
    );

    if (result == true) {
      await AnalyticsService().recordRating(
        selectedRating,
        ratingController.text,
      );
      await AnalyticsService().markAppAsRated();
      if (context.mounted) {
        setState(() => _hasRated = true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.thankYouFeedback)),
        );
      }
    }
    ratingController.dispose();
  }

  Widget _buildActionTile(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return SettingsListTile(
      leading: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [iconColor, iconColor.withValues(alpha: 0.7)],
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
      title: title,
      subtitle: subtitle,
      trailing: onTap != null
          ? Icon(
              CupertinoIcons.chevron_forward,
              size: 18,
              color: context.isDark
                  ? AppTheme.darkSecondaryText
                  : AppTheme.lightSecondaryText,
            )
          : null,
      onTap: onTap,
    );
  }
}
