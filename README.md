# FH6-Ultrawide-Fix v1.0

![FH6 Ultrawide Fix — 16:9 opening into 21:9](assets/fh6-header-21x9.jpg)

[中文](#中文) | [English](#english)

---

## 中文

这个 mod 移除《极限竞速：地平线 6》在 21:9 屏幕下存在的黑边：过场、加载画面和全屏视频。在 GitHub 上发布和维护：<https://github.com/zzzLiu/FH6-Ultrawide-Fix>

### 安装

1. 下载发布包里的 zip。
2. Steam：把 `mediapc` 放在 `forzahorizon6.exe` 旁边。放完是 `ForzaHorizon6\mediapc`。
3. 微软商店 / Xbox 应用：放进 Content 文件夹。放完是 `Forza Horizon 6\Content\mediapc`。

提示合并时选择合并 / 替换。

本 mod 只在 `mediapc` 覆盖目录里放文件，不修改游戏本体。游戏更新后，如果过场或界面出现异常，先卸载本 mod 看是否恢复，并留意本项目是否有更新版本。

本 mod 有 875 个文件。它和其他 mod 会不会冲突，我无法逐一确认，请自行判断。两个 mod 改到同一个文件时，后安装的会覆盖先安装的。安装前请先备份游戏目录里已有的 `mediapc` 文件夹。

！！！本 Mod 不涉及游戏的平衡问题，只修改了 UI 部分，理论上没有封号风险。我自己线上游玩没有问题，但是无法百分之百保证，封号风险请自行斟酌！！！

### 测试与改动

在所有宽屏上都可以安装，并且可以无损卸载。在 **21:9、3440×1440** 分辨率下测试。更宽的屏幕也有效果，但受限于原始素材，不能兼顾所有情况。

对比图上方是原版，下方是本 mod。

**游戏内实时过场**（车库、出发、赛前、倒计时、终点、自由漫游开场等）

去掉遮幅黑边。

![倒计时。上方原版，下方本 mod](assets/media/13-countdown.jpg)

**全屏剧情视频**（表演赛开场、冲刺赛开场、剧情片段）

等比铺满，裁掉原始素材自带的黑条。

![剧情视频。上方原版，下方本 mod](assets/media/17-cutscene.jpg)

**季节切换动画**

等比铺满宽度，保留原片的超宽画幅。

**赛后名次画面**

装饰背景铺满屏幕，文字位置不变。

![赛后名次。上方原版，下方本 mod](assets/media/16-results.jpg)

**车库主菜单左侧格子**

等比放大并贴齐左边缘，适配屏幕。

![车库主菜单。上方原版，下方本 mod](assets/media/04-garage.jpg)

**游戏启动后的标题画面**（“开始游戏”那一页）

原始素材，等比铺满，上下裁切。

![标题画面。上方原版，下方本 mod](assets/media/01-main-menu.jpg)

**Horizon Festival 加载动画**

原始素材等比铺满，上下有裁切。

![Horizon Festival 加载。上方原版，下方本 mod](assets/media/11-horizon-loading.jpg)

**普通加载画面**（快速移动等）

背景铺满宽度，底部留一条黑边显示加载提示和统计。上下有轻微的裁切。

![加载画面。上方原版，下方本 mod](assets/media/02-loading-1.jpg)

### mod 包含的文件 / 卸载

一共 875 个文件。完整列表在安装目录的 `mediapc\FH6-Ultrawide-Fix-files.txt`，仓库里的副本是 [`mod/mediapc/FH6-Ultrawide-Fix-files.txt`](mod/mediapc/FH6-Ultrawide-Fix-files.txt)。

```
mediapc\FH6-Ultrawide-Fix-files.txt
mediapc\UI\Scenes\Anthem\A_DestinationMenu.xaml
mediapc\UI\Scenes\Anthem\A_InitialDriveSeasonTransitionFMV.xaml
mediapc\UI\Scenes\Anthem\A_MotionGraphics.xaml
mediapc\UI\Scenes\Anthem\A_PostRaceFinishLine.xaml
mediapc\UI\Scenes\Anthem\A_Splash.xaml
mediapc\UI\Scenes\Anthem\A_VideoPlayer.xaml
mediapc\UI\Scenes\Anthem\Loading.xaml
mediapc\Cinematics\   （867 个 .xml，整个文件夹）
```

**卸载：**删除 `mediapc\FH6-Ultrawide-Fix-files.txt`、上面 7 个 `.xaml` 文件，以及 `mediapc\Cinematics` 文件夹。游戏会自动改回读取原版文件。

- 如果你的 `mediapc\Cinematics` 里还有其他 mod 的文件，请对照 `mediapc\FH6-Ultrawide-Fix-files.txt` 只删除本 mod 的文件。删完后把这个清单文件也一起删掉。
- `mediapc\UI` 里的其他文件不属于本 mod，不要删。

---

## English

This mod removes the black bars Forza Horizon 6 has on 21:9 screens: cutscenes, loading screens, and fullscreen video. Published and maintained on GitHub: <https://github.com/zzzLiu/FH6-Ultrawide-Fix>

### Install

1. Download the zip from Releases.
2. Steam: put `mediapc` next to `forzahorizon6.exe`. The result is `ForzaHorizon6\mediapc`.
3. Microsoft Store / Xbox app: put it in the Content folder. The result is `Forza Horizon 6\Content\mediapc`.

Choose merge / replace if prompted.

This mod only adds files to the `mediapc` override folder; game files are not modified. If cutscenes or menus misbehave after a game update, uninstall this mod first to check, and look for an updated version here.

This mod is 875 files. I can't check it against every other mod, so judge conflicts for yourself. If two mods edit the same file, the one installed last wins. Back up any existing `mediapc` folder before installing.

!!! This mod does not affect game balance and only changes the UI, so there is theoretically no ban risk. I have had no problems playing online, but that cannot be fully guaranteed. Judge the ban risk for yourself !!!

### Testing and changes

It can be installed on any ultrawide display, and uninstalled cleanly. Tested at **21:9, 3440×1440**. Wider screens are affected too, but the result is limited by the original footage and can't cover every case.

In each comparison, the original is on top and this mod is below.

**In-engine cutscenes** (garage, departure, pre-race, countdown, finish line, free-roam intros, etc.)

Letterbox bars removed.

![Countdown. Original on top, this mod below](assets/media/13-countdown.jpg)

**Full-screen story videos** (Showcase intros, Rush intros, story clips)

Scaled to fill, cropping the black bars baked into the original footage.

![Story video. Original on top, this mod below](assets/media/17-cutscene.jpg)

**Season change videos**

Scaled to the full width, original ultrawide framing kept.

**Post-race results screen**

Background fills the screen, text stays put.

![Post-race results. Original on top, this mod below](assets/media/16-results.jpg)

**Garage menu lattice on the left**

Scaled uniformly and aligned to the left edge to fit the screen.

![Garage menu. Original on top, this mod below](assets/media/04-garage.jpg)

**Title screen after launch** (“Start Game” page)

Original footage, scaled to fill, cropped top and bottom.

![Title screen. Original on top, this mod below](assets/media/01-main-menu.jpg)

**Horizon Festival loading animation**

Original footage scaled to fill, cropped top and bottom.

![Horizon Festival loading. Original on top, this mod below](assets/media/11-horizon-loading.jpg)

**Regular loading screens** (fast travel, etc.)

Background fills the width. A black strip stays at the bottom for hints and stats. Slight crop top and bottom.

![Loading screen. Original on top, this mod below](assets/media/02-loading-1.jpg)

### Files / uninstall

875 files in total. The full list ships in the install as `mediapc\FH6-Ultrawide-Fix-files.txt`. The copy in this repo is [`mod/mediapc/FH6-Ultrawide-Fix-files.txt`](mod/mediapc/FH6-Ultrawide-Fix-files.txt).

```
mediapc\FH6-Ultrawide-Fix-files.txt
mediapc\UI\Scenes\Anthem\A_DestinationMenu.xaml
mediapc\UI\Scenes\Anthem\A_InitialDriveSeasonTransitionFMV.xaml
mediapc\UI\Scenes\Anthem\A_MotionGraphics.xaml
mediapc\UI\Scenes\Anthem\A_PostRaceFinishLine.xaml
mediapc\UI\Scenes\Anthem\A_Splash.xaml
mediapc\UI\Scenes\Anthem\A_VideoPlayer.xaml
mediapc\UI\Scenes\Anthem\Loading.xaml
mediapc\Cinematics\   (867 .xml files, the whole folder)
```

**Uninstall:** delete `mediapc\FH6-Ultrawide-Fix-files.txt`, the 7 `.xaml` files above, and the `mediapc\Cinematics` folder. The game falls back to its original files.

- If `mediapc\Cinematics` also contains files from other mods, use `mediapc\FH6-Ultrawide-Fix-files.txt` to delete only this mod's files, then delete that list too.
- Other files under `mediapc\UI` are not part of this mod; leave them alone.

---

## 捐赠 / Support

<a href="https://ko-fi.com/zzzliu"><img src="assets/kofi-button.png" height="36" alt="Buy me a coffee"></a>

https://ko-fi.com/zzzliu

<img src="assets/赞赏码.jpg" width="280" alt="微信赞赏码">

微信赞赏码

---

### For maintainers / 维护

```powershell
.\tools\build-release.ps1                   # rebuild the file list and dist\FH6-Ultrawide-Fix-v1.0.zip
.\tools\toggle-mod.ps1 off|on|status       # temporarily disable / re-enable the installed mod (for comparisons)
```
