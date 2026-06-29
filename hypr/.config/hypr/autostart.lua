-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
    hl.exec_cmd("~/workspace/Waybar/build/waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("systemctl --user start hyprland-autoname-workspaces")
    hl.exec_cmd("hypridle")

    hl.exec_cmd("slack")
    hl.exec_cmd("/opt/teams-for-linux/teams-for-linux")
    hl.exec_cmd("/opt/google/chrome/google-chrome --profile-directory=Default --app-id=faolnafnngnfdaknnbpnkhgohbobgegn %U &")
    hl.exec_cmd("logitune --minimized")
end)

