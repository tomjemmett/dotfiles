-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- disable hardware cursors
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
-- force explicit sync
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("WLR_RENDERER", "vulkan")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("ELECTRON_PASSWORD_STORE", "gnome-libsecret")
hl.env("MOZ_ENABLE_WAYLAND", "1")

