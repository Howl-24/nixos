#!/usr/bin/env bash

# 壁纸目录
HORIZONTAL_WALLPAPER_DIR="$HOME/nixos/modules/themes/wallpapers/horizontal/"
VERTICAL_WALLPAPER_DIR="$HOME/nixos/modules/themes/wallpapers/vertical/"

# 获取所有显示器信息
MONITORS=$(hyprctl monitors -j | jq -c '.[]')

# 遍历所有显示器
while read -r MONITOR; do
  NAME=$(echo "$MONITOR" | jq -r '.name')
  TRANSFORM=$(echo "$MONITOR" | jq -r '.transform')

  # 根据 transform 选择壁纸目录
  if [[ $((TRANSFORM % 2)) -eq 0 ]]; then
    WALLPAPER_DIR="$HORIZONTAL_WALLPAPER_DIR"
  else
    WALLPAPER_DIR="$VERTICAL_WALLPAPER_DIR"
  fi

  # 获取随机壁纸
  WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

  # 确保找到壁纸文件
  if [[ -f "$WALLPAPER" ]]; then
    # 预加载壁纸
    hyprctl hyprpaper preload "$WALLPAPER"
    # 应用壁纸
    hyprctl hyprpaper wallpaper "$NAME,$WALLPAPER"
  else
    echo "未找到壁纸文件，跳过 $NAME"
  fi
done <<<"$MONITORS"
