{ self, inputs, ... }: {
  flake.homeModules.noctalia = { pkgs, ... }: {
    imports = [ inputs.noctalia.homeModules.default ];

    programs.noctalia-shell = {
      enable = true;
      settings = {
        settingsVersion = 59;
        bar = {
          barType = "simple";
          position = "top";
          monitors = [
            "DP-1"
            "DP-3"
            "eDP-1"
            "Virtual-1"
          ];
          density = "comfortable";
          showOutline = false;
          showCapsule = true;
          capsuleOpacity = 0.5;
          capsuleColorKey = "none";
          widgetSpacing = 6;
          contentPadding = 2;
          fontScale = 1;
          enableExclusionZoneInset = true;
          backgroundOpacity = 0.75;
          useSeparateOpacity = true;
          marginVertical = 4;
          marginHorizontal = 4;
          frameThickness = 8;
          frameRadius = 12;
          outerCorners = true;
          hideOnOverview = false;
          displayMode = "always_visible";
          autoHideDelay = 500;
          autoShowDelay = 150;
          showOnWorkspaceSwitch = true;
          widgets = {
            left = [
              {
                colorizeSystemIcon = "none";
                colorizeSystemText = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "rocket";
                iconColor = "none";
                id = "Launcher";
                useDistroLogo = false;
              }
              {
                clockColor = "secondary";
                customFont = "";
                formatHorizontal = "HH:mm ddd, MMM dd";
                formatVertical = "HH mm - MM dd";
                id = "Clock";
                tooltipFormat = "HH:mm ddd, MMM dd";
                useCustomFont = false;
              }
              {
                compactMode = true;
                diskPath = "/";
                iconColor = "secondary";
                id = "SystemMonitor";
                showCpuCores = false;
                showCpuFreq = false;
                showCpuTemp = true;
                showCpuUsage = true;
                showDiskAvailable = true;
                showDiskUsage = false;
                showDiskUsageAsPercent = true;
                showGpuTemp = true;
                showLoadAverage = false;
                showMemoryAsPercent = false;
                showMemoryUsage = true;
                showNetworkStats = false;
                showSwapUsage = false;
                textColor = "none";
                useMonospaceFont = true;
                usePadding = false;
              }
              {
                colorizeDistroLogo = false;
                colorizeSystemIcon = "none";
                colorizeSystemText = "none";
                customIconPath = "";
                enableColorization = false;
                icon = "noctalia";
                id = "ControlCenter";
                useDistroLogo = false;
              }
            ];
            center = [
              {
                characterCount = 2;
                colorizeIcons = false;
                emptyColor = "secondary";
                enableScrollWheel = true;
                focusedColor = "primary";
                followFocusedScreen = false;
                fontWeight = "bold";
                groupedBorderOpacity = 1;
                hideUnoccupied = false;
                iconScale = 0.8;
                id = "Workspace";
                labelMode = "index";
                occupiedColor = "secondary";
                pillSize = 0.6;
                showApplications = false;
                showApplicationsHover = false;
                showBadge = true;
                showLabelsOnlyWhenOccupied = true;
                unfocusedIconsOpacity = 1;
              }
              {
                colorizeIcons = false;
                hideMode = "hidden";
                id = "ActiveWindow";
                maxWidth = 250;
                scrollingMode = "hover";
                showIcon = true;
                showText = false;
                textColor = "primary";
                useFixedWidth = false;
              }
              {
                compactMode = false;
                hideMode = "hidden";
                hideWhenIdle = false;
                id = "MediaMini";
                maxWidth = 300;
                panelShowAlbumArt = true;
                scrollingMode = "hover";
                showAlbumArt = true;
                showArtistFirst = true;
                showProgressRing = true;
                showVisualizer = true;
                textColor = "none";
                useFixedWidth = false;
                visualizerType = "linear";
              }
              {
                defaultSettings = {};
                id = "plugin:workspace-overview";
              }
            ];
            right = [
              {
                blacklist = [];
                chevronColor = "none";
                colorizeIcons = false;
                drawerEnabled = true;
                hidePassive = false;
                id = "Tray";
                pinned = [
                  "ibus-ui-gtk3"
                  "Vesktop"
                ];
              }
              {
                defaultSettings = {
                  autoMount = false;
                  fileBrowser = "yazi";
                  hideWhenEmpty = false;
                  iconColor = "none";
                  showBadge = false;
                  showNotifications = true;
                  terminalCommand = "kitty";
                };
                id = "plugin:usb-drive-manager";
              }
              {
                defaultSettings = {
                  compactMode = false;
                  defaultPeerAction = "copy-ip";
                  hideDisconnected = false;
                  hideMullvadExitNodes = true;
                  loginServer = "";
                  pingCount = 5;
                  refreshInterval = 5000;
                  showIpAddress = true;
                  showPeerCount = true;
                  sshUsername = "";
                  taildropDownloadDir = "~/Downloads";
                  taildropEnabled = true;
                  taildropReceiveMode = "operator";
                  terminalCommand = "";
                };
                id = "plugin:tailscale";
              }
              {
                hideWhenZero = false;
                hideWhenZeroUnread = false;
                iconColor = "none";
                id = "NotificationHistory";
                showUnreadBadge = true;
                unreadBadgeColor = "primary";
              }
              {
                deviceNativePath = "__default__";
                displayMode = "graphic-clean";
                hideIfIdle = false;
                hideIfNotDetected = true;
                id = "Battery";
                showNoctaliaPerformance = false;
                showPowerProfiles = false;
              }
              {
                applyToAllMonitors = false;
                displayMode = "onhover";
                iconColor = "none";
                id = "Brightness";
                textColor = "none";
              }
              {
                displayMode = "onhover";
                iconColor = "none";
                id = "Volume";
                middleClickCommand = "pwvucontrol || pavucontrol";
                textColor = "none";
              }
              {
                displayMode = "onhover";
                iconColor = "none";
                id = "Network";
                textColor = "none";
              }
              {
                displayMode = "onhover";
                iconColor = "none";
                id = "Bluetooth";
                textColor = "none";
              }
              {
                defaultSettings = {
                  debug = false;
                  rogcc = {
                    listenToNotifications = false;
                  };
                  supergfxctl = {
                    patchPending = true;
                    polling = false;
                    pollingInterval = 3000;
                  };
                };
                id = "plugin:noctalia-supergfxctl";
              }
              {
                defaultSettings = {
                  colorHistory = [];
                  detectedCompositor = "";
                  detectedRecorder = "";
                  filenameFormat = "";
                  installedLangs = [
                    "eng"
                  ];
                  paletteColors = [];
                  screenshotPath = "";
                  selectedOcrLang = "eng";
                  transAvailable = false;
                  videoPath = "";
                };
                id = "plugin:screen-toolkit";
              }
              {
                defaultSettings = {
                  activeColor = "primary";
                  camFilterRegex = "";
                  enableToast = true;
                  hideInactive = false;
                  iconSpacing = 4;
                  inactiveColor = "none";
                  micFilterRegex = "";
                  removeMargins = false;
                };
                id = "plugin:privacy-indicator";
              }
            ];
          };
          mouseWheelAction = "none";
          reverseScroll = false;
          mouseWheelWrap = true;
          middleClickAction = "none";
          middleClickFollowMouse = false;
          middleClickCommand = "";
          rightClickAction = "controlCenter";
          rightClickFollowMouse = true;
          rightClickCommand = "";
          screenOverrides = [
            {
              density = "spacious";
              enabled = true;
              name = "DP-3";
              position = "left";
            }
          ];
        };
        general = {
          avatarImage = "/home/libor/.face";
          dimmerOpacity = 0.55;
          showScreenCorners = false;
          forceBlackScreenCorners = false;
          scaleRatio = 1;
          radiusRatio = 1;
          iRadiusRatio = 1;
          boxRadiusRatio = 1;
          screenRadiusRatio = 1;
          animationSpeed = 1;
          animationDisabled = false;
          compactLockScreen = false;
          lockScreenAnimations = false;
          lockOnSuspend = true;
          showSessionButtonsOnLockScreen = true;
          showHibernateOnLockScreen = false;
          enableLockScreenMediaControls = false;
          enableShadows = true;
          enableBlurBehind = true;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          language = "";
          allowPanelsOnScreenWithoutBar = true;
          showChangelogOnStartup = true;
          telemetryEnabled = true;
          enableLockScreenCountdown = true;
          lockScreenCountdownDuration = 10000;
          autoStartAuth = false;
          allowPasswordWithFprintd = false;
          clockStyle = "custom";
          clockFormat = "hh\\nmm";
          passwordChars = false;
          lockScreenMonitors = [];
          lockScreenBlur = 0;
          lockScreenTint = 0;
          keybinds = {
            keyUp = [
              "Up"
            ];
            keyDown = [
              "Down"
            ];
            keyLeft = [
              "Left"
            ];
            keyRight = [
              "Right"
            ];
            keyEnter = [
              "Return"
              "Enter"
            ];
            keyEscape = [
              "Esc"
            ];
            keyRemove = [
              "Del"
            ];
          };
          reverseScroll = false;
          smoothScrollEnabled = true;
        };
        ui = {
          fontDefault = "Noto Sans";
          fontFixed = "MesloLGS Nerd Font";
          fontDefaultScale = 0.95;
          fontFixedScale = 1;
          tooltipsEnabled = true;
          scrollbarAlwaysVisible = true;
          boxBorderEnabled = false;
          panelBackgroundOpacity = 0.8;
          translucentWidgets = false;
          panelsAttachedToBar = true;
          settingsPanelMode = "attached";
          settingsPanelSideBarCardStyle = false;
        };
        location = {
          name = "Markham, ON";
          weatherEnabled = true;
          weatherShowEffects = true;
          weatherTaliaMascotAlways = false;
          useFahrenheit = false;
          use12hourFormat = false;
          showWeekNumberInCalendar = false;
          showCalendarEvents = true;
          showCalendarWeather = true;
          analogClockInCalendar = false;
          firstDayOfWeek = "unknown character to parse: -";
          ",
          " = "unknown character to parse: h";
          deWeatherTimezone = false;
          hideWeatherCityName = false;
          autoLocate = false;
        };
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };
        wallpaper = {
          enabled = true;
          overviewEnabled = false;
          directory = "/home/yippie/Pictures/Wallpapers";
          monitorDirectories = [];
          enableMultiMonitorDirectories = true;
          showHiddenFiles = false;
          viewMode = "single";
          setWallpaperOnAllMonitors = false;
          linkLightAndDarkWallpapers = true;
          fillMode = "crop";
          fillColor = "#000000";
          useSolidColor = false;
          solidColor = "#1a1a2e";
          automationEnabled = false;
          wallpaperChangeMode = "random";
          randomIntervalSec = 300;
          transitionDuration = 1500;
          transitionType = [
            "fade"
            "disc"
            "stripes"
            "wipe"
            "pixelate"
            "honeycomb"
          ];
          skipStartupTransition = false;
          transitionEdgeSmoothness = 5.0e-2;
          panelPosition = "follow_bar";
          hideWallpaperFilenames = false;
          useOriginalImages = false;
          overviewBlur = 0.4;
          overviewTint = 0.6;
          useWallhaven = false;
          wallhavenQuery = "";
          wallhavenSorting = "relevance";
          wallhavenOrder = "desc";
          wallhavenCategories = "111";
          wallhavenPurity = "100";
          wallhavenRatios = "";
          wallhavenApiKey = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenResolutionHeight = "";
          sortOrder = "name";
          favorites = [];
        };
        appLauncher = {
          enableClipboardHistory = true;
          autoPasteClipboard = false;
          enableClipPreview = true;
          clipboardWrapText = true;
          enableClipboardSmartIcons = true;
          enableClipboardChips = true;
          clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
          clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
          position = "center";
          pinnedApps = [
            "org.kde.dolphin"
            "zen"
            "discord"
            "vesktop"
            "kitty"
            "nvim"
            "code"
            "io.github.quodlibet.QuodLibet"
            "spotify"
            "org.nicotine_plus.Nicotine"
            "jetbrains-clion-24480ba3-a645-43da-b2e3-0bf31f5626b5"
            "jetbrains-idea-4e36cc9d-0a21-40eb-af86-d1ae184050c0"
            "org.vinegarhq.Sober"
            "github-desktop"
            "zen-beta"
            "com.github.wwmm.easyeffects"
            "osu-lazer"
            "osu!"
          ];
          sortByMostUsed = true;
          terminalCommand = "kitty -e ";
          customLaunchPrefixEnabled = false;
          customLaunchPrefix = "";
          viewMode = "grid";
          showCategories = true;
          iconMode = "tabler";
          showIconBackground = false;
          enableSettingsSearch = true;
          enableWindowsSearch = true;
          enableSessionSearch = true;
          ignoreMouseInput = false;
          screenshotAnnotationTool = "";
          overviewLayer = false;
          density = "default";
        };
        controlCenter = {
          position = "center";
          diskPath = "/";
          shortcuts = {
            left = [
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
              {
                id = "WallpaperSelector";
              }
              {
                id = "NoctaliaPerformance";
              }
            ];
            right = [
              {
                id = "Notifications";
              }
              {
                id = "PowerProfile";
              }
              {
                id = "KeepAwake";
              }
              {
                id = "NightLight";
              }
            ];
          };
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = false;
              id = "brightness-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
        };
        systemMonitor = {
          cpuWarningThreshold = 80;
          cpuCriticalThreshold = 90;
          tempWarningThreshold = 80;
          tempCriticalThreshold = 90;
          gpuWarningThreshold = 80;
          gpuCriticalThreshold = 90;
          memWarningThreshold = 80;
          memCriticalThreshold = 90;
          swapWarningThreshold = 80;
          swapCriticalThreshold = 90;
          diskWarningThreshold = 80;
          diskCriticalThreshold = 90;
          diskAvailWarningThreshold = 20;
          diskAvailCriticalThreshold = 10;
          batteryWarningThreshold = 20;
          batteryCriticalThreshold = 5;
          enableDgpuMonitoring = true;
          useCustomColors = false;
          warningColor = "";
          criticalColor = "";
          externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
        };
        noctaliaPerformance = {
          disableWallpaper = true;
          disableDesktopWidgets = true;
        };
        dock = {
          enabled = true;
          position = "bottom";
          displayMode = "auto_hide";
          dockType = "attached";
          backgroundOpacity = 0.5;
          floatingRatio = 1;
          size = 1.5;
          onlySameOutput = true;
          monitors = [
            "DP-1"
            "eDP-1"
            "Virtual-1"
          ];
          pinnedApps = [
            "zen-beta"
            "org.gnome.Nautilus"
            "kitty"
            "code"
            "discord"
          ];
          colorizeIcons = false;
          showLauncherIcon = false;
          launcherPosition = "end";
          launcherUseDistroLogo = false;
          launcherIcon = "";
          launcherIconColor = "none";
          pinnedStatic = true;
          inactiveIndicators = true;
          groupApps = false;
          groupContextMenuMode = "extended";
          groupClickAction = "cycle";
          groupIndicatorStyle = "dots";
          deadOpacity = 1;
          animationSpeed = 1;
          sitOnFrame = false;
          showDockIndicator = false;
          indicatorThickness = 3;
          indicatorColor = "primary";
          indicatorOpacity = 0.6;
        };
        network = {
          bluetoothRssiPollingEnabled = false;
          bluetoothRssiPollIntervalMs = 10000;
          networkPanelView = "wifi";
          wifiDetailsViewMode = "grid";
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          disableDiscoverability = false;
          bluetoothAutoConnect = true;
        };
        sessionMenu = {
          enableCountdown = true;
          countdownDuration = 10000;
          position = "center";
          showHeader = true;
          showKeybinds = true;
          largeButtonsStyle = false;
          largeButtonsLayout = "single-row";
          powerOptions = [
            {
              action = "lock";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "1";
            }
            {
              action = "suspend";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "2";
            }
            {
              action = "hibernate";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "3";
            }
            {
              action = "reboot";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "4";
            }
            {
              action = "logout";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "5";
            }
            {
              action = "shutdown";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "6";
            }
            {
              action = "rebootToUefi";
              command = "";
              countdownEnabled = true;
              enabled = true;
              keybind = "7";
            }
            {
              action = "userspaceReboot";
              command = "";
              countdownEnabled = true;
              enabled = false;
              keybind = "";
            }
          ];
        };
        notifications = {
          enabled = true;
          enableMarkdown = false;
          density = "default";
          monitors = [];
          location = "top_right";
          overlayLayer = true;
          backgroundOpacity = 1;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          clearDismissed = true;
          saveToHistory = {
            low = true;
            normal = true;
            critical = true;
          };
          sounds = {
            enabled = false;
            volume = 0.5;
            separateSounds = false;
            criticalSoundFile = "";
            normalSoundFile = "";
            lowSoundFile = "";
            excludedApps = "discord,firefox,chrome,chromium,edge";
          };
          enableMediaToast = false;
          enableKeyboardLayoutToast = true;
          enableBatteryToast = true;
        };
        osd = {
          enabled = true;
          location = "top_right";
          autoHideMs = 2000;
          overlayLayer = true;
          backgroundOpacity = 1;
          enabledTypes = [
            0
            1
            2
          ];
          monitors = [
            "DP-1"
          ];
        };
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          spectrumFrameRate = 240;
          visualizerType = "linear";
          spectrumMirrored = true;
          mprisBlacklist = [];
          preferredPlayer = "quodlibet, spotify";
          volumeFeedback = false;
          volumeFeedbackSoundFile = "";
        };
        brightness = {
          brightnessStep = 5;
          enforceMinimum = true;
          enableDdcSupport = true;
          backlightDeviceMappings = [];
        };
        colorSchemes = {
          useWallpaperColors = true;
          predefinedScheme = "Catppuccin";
          darkMode = true;
          schedulingMode = "off";
          manualSunrise = "06:30";
          manualSunset = "18:30";
          generationMethod = "fruit-salad";
          monitorForColors = "eDP-1";
          syncGsettings = true;
        };
        templates = {
          activeTemplates = [
            {
              enabled = true;
              id = "hyprland";
            }
            {
              enabled = true;
              id = "kcolorscheme";
            }
            {
              enabled = true;
              id = "hyprtoolkit";
            }
            {
              enabled = true;
              id = "btop";
            }
            {
              enabled = true;
              id = "code";
            }
            {
              enabled = true;
              id = "spicetify";
            }
            {
              enabled = true;
              id = "gtk";
            }
            {
              enabled = true;
              id = "kitty";
            }
            {
              enabled = true;
              id = "qt";
            }
            {
              enabled = true;
              id = "pywalfox";
            }
            {
              enabled = true;
              id = "zed";
            }
          ];
          enableUserTheming = false;
        };
        nightLight = {
          enabled = false;
          forced = false;
          autoSchedule = true;
          nightTemp = "4000";
          dayTemp = "6500";
          manualSunrise = "06:30";
          manualSunset = "18:30";
        };
        hooks = {
          enabled = false;
          wallpaperChange = "";
          darkModeChange = "";
          screenLock = "";
          screenUnlock = "";
          performanceModeEnabled = "";
          performanceModeDisabled = "";
          startup = "";
          session = "";
          colorGeneration = "";
        };
        plugins = {
          autoUpdate = true;
          notifyUpdates = true;
        };
        idle = {
          enabled = false;
          screenOffTimeout = 600;
          lockTimeout = 660;
          suspendTimeout = 1800;
          fadeDuration = 5;
          screenOffCommand = "";
          lockCommand = "";
          suspendCommand = "";
          resumeScreenOffCommand = "";
          resumeLockCommand = "";
          resumeSuspendCommand = "";
          customCommands = "[]";
        };
        desktopWidgets = {
          enabled = true;
          overviewEnabled = true;
          gridSnap = false;
          gridSnapScale = false;
          monitorWidgets = [
            {
              name = "DP-3";
              widgets = [
                {
                  hideMode = "visible";
                  id = "MediaPlayer";
                  roundedCorners = true;
                  scale = 1.0014547;
                  showAlbumArt = true;
                  showBackground = true;
                  showButtons = true;
                  showVisualizer = true;
                  visualizerType = "linear";
                  x = 634;
                  y = 335;
                }
                {
                  diskPath = "/";
                  id = "SystemStat";
                  layout = "side";
                  roundedCorners = true;
                  scale = 1.0217104;
                  showBackground = true;
                  statType = "CPU";
                  x = 789;
                  y = 185;
                }
              ];
            }
            {
              name = "DP-1";
              widgets = [];
            }
          ];
        };
      };
    };
  };
}