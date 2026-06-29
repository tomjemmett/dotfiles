--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

-- Example windowrules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },

    no_focus = true
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- HyprEmoji config
hl.window_rule({
    name = "hypremoji",
    match = {
        title = "^(HyprEmoji)$"
    },
    float = true
})

hl.window_rule({
    match = {
        class = "slack"
    },
    workspace = "1 silent"
})
hl.window_rule({
    match = {
        class = "teams-for-linux"
    },
    workspace = "2 silent"
})
hl.window_rule({
    match = {
        class = "chrome-faolnafnngnfdaknnbpnkhgohbobgegn-Default"
    },
    workspace = "3 silent"
})
hl.window_rule({
    match = {
      class = "chatgpt-desktop-client"
    },
    workspace = "special:chatgpt silent"
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

