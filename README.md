# FH6-Ultrawide-Fix

[中文](#中文) | [English](#english)

---

## 中文

《极限竞速：地平线 6》(Forza Horizon 6) 的 **21:9 宽屏 mod**，去掉过场动画、加载画面和全屏视频两侧及上下的黑边。

### 测试情况

- 只在 **3440×1440（21:9）** 下测试过。
- 其他分辨率没有测试，**不保证效果**。
- 比 21:9 更宽的屏幕（如 32:9）**不保证效果**，作者没有更宽的显示器，无法测试。

### 安装

1. 下载 Release 里的 `FH6-Ultrawide-Fix-vX.X.X.zip`。
2. 打开游戏安装目录（有 `forzahorizon6.exe` 的那个文件夹）。
3. 把 zip 里的 `mediapc` 文件夹直接拖进去，提示合并时选择合并 / 替换。

如果你装了其他修改同一批文件的 mod，后装的会覆盖先装的。安装前建议先备份游戏目录里已有的 `mediapc` 文件夹。

### 改动的情景

所有放大都是**等比放大**，不会拉伸变形。区别在于有没有裁掉画面内容。

**画面完整，或几乎无损**

| 情景 | 处理方式 |
|---|---|
| 游戏内实时过场（车库、购车、出发、赛前、倒计时、终点、自由漫游开场等） | 去掉过场的遮幅黑边 |
| 全屏剧情视频（表演赛开场、冲刺赛开场、剧情片段） | 等比放大铺满。素材本身带上下黑条，放大后裁掉的基本只是黑条，画面上下各损失不到 1% |
| 季节切换动画 | 等比放大到铺满宽度。保留原片的超宽画幅，上下保留片子自带的细黑边，画面完整无裁切 |
| 赛后名次画面 | 装饰背景等比放大铺满全屏，文字位置不变 |

**等比放大，裁切了部分视频素材**

| 情景 | 处理方式 |
|---|---|
| 游戏启动后的标题画面（"开始游戏"那一页） | 16:9 视频等比放大铺满，上下各裁掉约 13%。Logo 和菜单文字位置不变；按开始后的黑场过渡也改为全屏 |
| Horizon Festival 加载动画 | 16:9 动画等比放大铺满，上下各裁掉约 13% |
| 普通加载画面（快速移动等） | 背景图 / 视频等比放大铺满宽度，底部保留黑色区域显示加载提示和统计文字。素材上下各裁掉约 3% |

### mod 包含的文件 / 卸载

一共 873 个文件，完整列表见 [`FILES.txt`](FILES.txt)。

```
mediapc\UI\Scenes\Anthem\A_InitialDriveSeasonTransitionFMV.xaml
mediapc\UI\Scenes\Anthem\A_MotionGraphics.xaml
mediapc\UI\Scenes\Anthem\A_PostRaceFinishLine.xaml
mediapc\UI\Scenes\Anthem\A_Splash.xaml
mediapc\UI\Scenes\Anthem\A_VideoPlayer.xaml
mediapc\UI\Scenes\Anthem\Loading.xaml
mediapc\Cinematics\   （867 个 .xml，整个文件夹）
```

**卸载：**删除上面 6 个 `.xaml` 文件，以及 `mediapc\Cinematics` 文件夹。游戏会自动改回读取原版文件。

- 如果你的 `mediapc\Cinematics` 里还有其他 mod 的文件，请对照 `FILES.txt` 只删除本 mod 的文件。
- `mediapc\UI` 里的其他文件不属于本 mod，不要删。

### 注意

- 本 mod 只在 `mediapc` 覆盖目录里放文件，不修改游戏本体。
- 游戏更新后，如果过场或界面出现异常，先卸载本 mod 看是否恢复，并留意本项目是否有更新版本。
- 使用风险自负。

---

## English

A **21:9 ultrawide mod** for Forza Horizon 6. Removes the black bars around cinematics, loading screens and full-screen videos.

### Testing

- Tested **only at 3440×1440 (21:9)**.
- Other resolutions are untested and **not guaranteed** to work.
- Screens wider than 21:9 (e.g. 32:9) are **not guaranteed**; I don't have a wider monitor to test on.

### Install

1. Download `FH6-Ultrawide-Fix-vX.X.X.zip` from Releases.
2. Open the game install folder (the one containing `forzahorizon6.exe`).
3. Drag the `mediapc` folder from the zip into it and choose merge / replace.

Mods that change the same files will overwrite each other; whichever is installed last wins. Back up any existing `mediapc` folder first.

### What changes

All scaling is **uniform** (no stretching). The difference is whether any picture content gets cropped.

**Full picture, or practically lossless**

| Scene | What happens |
|---|---|
| In-engine cutscenes (garage, car purchase, departure, pre-race, countdown, finish line, free-roam intros, etc.) | Letterbox / pillarbox bars removed |
| Full-screen story videos (Showcase intros, Rush intros, story clips) | Scaled up to fill. The videos have black bars baked in at the top and bottom, so the crop removes almost only those bars; less than 1% of the picture lost at top and bottom |
| Season change videos | Scaled to fill the width. The original extra-wide framing is kept, including its thin baked-in bars at top and bottom; nothing cropped |
| Post-race results screen | Decorative background scaled to fill the screen; text unchanged |

**Uniformly scaled, part of the video cropped**

| Scene | What happens |
|---|---|
| Title screen after launch ("Start Game" page) | 16:9 video scaled to fill, about 13% cropped at top and bottom. Logo and menu unchanged; the fade-to-black after pressing Start now covers the full screen |
| Horizon Festival loading animation | 16:9 animation scaled to fill, about 13% cropped at top and bottom |
| Regular loading screens (fast travel, etc.) | Background image / video scaled to the full width; a black strip is kept at the bottom for the loading hints and stats. About 3% cropped at top and bottom |

### Files / uninstall

873 files in total; full list in [`FILES.txt`](FILES.txt).

```
mediapc\UI\Scenes\Anthem\A_InitialDriveSeasonTransitionFMV.xaml
mediapc\UI\Scenes\Anthem\A_MotionGraphics.xaml
mediapc\UI\Scenes\Anthem\A_PostRaceFinishLine.xaml
mediapc\UI\Scenes\Anthem\A_Splash.xaml
mediapc\UI\Scenes\Anthem\A_VideoPlayer.xaml
mediapc\UI\Scenes\Anthem\Loading.xaml
mediapc\Cinematics\   (867 .xml files, the whole folder)
```

**Uninstall:** delete the 6 `.xaml` files above and the `mediapc\Cinematics` folder. The game falls back to its original files.

- If `mediapc\Cinematics` also contains files from other mods, use `FILES.txt` to delete only this mod's files.
- Other files under `mediapc\UI` are not part of this mod; leave them alone.

### Notes

- This mod only adds files to the `mediapc` override folder; game files are not modified.
- If cutscenes or menus misbehave after a game update, uninstall this mod first to check, and look for an updated version here.
- Use at your own risk.

---

### For maintainers / 维护

```powershell
.\tools\build-release.ps1 -Version 1.0.0   # rebuild FILES.txt and dist\*.zip from mod\
.\tools\toggle-mod.ps1 off|on|status       # temporarily disable / re-enable the installed mod (for comparisons)
```
